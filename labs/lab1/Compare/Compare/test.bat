@echo off
rem %1 - �������� ������� ��������� ��������� ������ bat-����� (����� �� ����)
rem %~1 - �������� ������� ��������� ��������� ������ bat-����� � ��������� ����������� ������� (���� ��� ����)

rem ���������� PROGRAM ����� ������� ������ �������� ��������� ������ ����������� � �������
set PROGRAM="%~1"

set OUT="%TEMP%\out.txt"

rem ��������� �������� 1 ���������
%PROGRAM% empty1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% invalidareguments_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��� �������� ����������
%PROGRAM% > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% invalidareguments_out.txt
if ERRORLEVEL 1 goto err

rem ��������� �������� 4 ����������
%PROGRAM% empty1.txt notsame1multiline.txt empty2.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% invalidareguments_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� 2 ������ ������
%PROGRAM% empty1.txt empty2.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% testempty2_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� ���� ������ �� ������ ���
%PROGRAM% simpletxt1.txt empty.txt > %OUT% 
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing1_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� ���� ����� ������ ���
%PROGRAM% simpletxt2.txt simpletxt1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing2_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� ���������� ������ � ���� ������ 
%PROGRAM% same1oneline.txt same2oneline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% sameoneline_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ���������� ���������� ������ � ��������� ������
%PROGRAM% same1multiline.txt same2multiline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% samemultiline_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� �� ���������� ������ � ���� ������
%PROGRAM% notsame1oneline.txt same1oneline.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame1_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� �� ���������� ������ � ��������� �����
%PROGRAM% notsame1multiline.txt same1multiline.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame2_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� �� ���������� ������ ������ � ��������� ����� � ������� � ���� ������
%PROGRAM% notsame1multiline.txt notsame1oneline.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame3_out.txt
if ERRORLEVEL 1 goto err


rem �������� ������ �� ���������
%PROGRAM% Compare1.cpp Compare2.cpp > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testcompare_out.txt
if ERRORLEVEL 1 goto err

echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1