@echo off
rem %1 - �������� ������� ��������� ��������� ������ bat-����� (����� �� ����)
rem %~1 - �������� ������� ��������� ��������� ������ bat-����� � ��������� ����������� ������� (���� ��� ����)

rem ���������� PROGRAM ����� ������� ������ �������� ��������� ������ ����������� � �������
set PROGRAM="%~1"

set OUT="%TEMP%\out.txt"

rem ��� ������� ��� ���������� ��������� ��������� ��� ��������
%PROGRAM% > nul
if NOT ERRORLEVEL 1 goto err

rem ��������� ��������� � ������ ������
%PROGRAM% < testempty1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% testempty1_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� 2 ������ ������
%PROGRAM% < testempty2.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% testempty2_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� ���� ������ �� ������ ���
%PROGRAM% < testnothing1.txt > %OUT% 
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing1_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� ���� ����� ������ ���
%PROGRAM% < testnothing2.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing2_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� ���������� ������ � ���� ������
%PROGRAM% < sameoneline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% sameoneline_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ���������� ���������� ������ � ��������� ������
%PROGRAM% < samemultiline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% samemultiline_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� �� ���������� ������ � ���� ������
%PROGRAM% < testnotsame1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame1_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� �� ���������� ������ � ��������� �����
%PROGRAM% < testnotsame2.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame2_out.txt
if ERRORLEVEL 1 goto err

rem ��������� ��������� �� ���������� ������ ������ � ��������� ����� � ������� � ���� ������
%PROGRAM% < testnotsame3.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame3_out.txt
if ERRORLEVEL 1 goto err


echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1