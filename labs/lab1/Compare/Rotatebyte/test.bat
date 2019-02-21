@echo off
rem %1 - �������� ������� ��������� ��������� ������ bat-����� (����� �� ����)
rem %~1 - �������� ������� ��������� ��������� ������ bat-����� � ��������� ����������� ������� (���� ��� ����)

rem ���������� PROGRAM ����� ������� ������ �������� ��������� ������ ����������� � �������
set PROGRAM="%~1"

set OUT="%TEMP%\out.txt"

rem �������� �������� �����
%PROGRAM% 17 2 L > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% basictest.txt
if ERRORLEVEL 1 goto err

rem ���� 1
%PROGRAM% 7 1 L > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% customcase1.txt
if ERRORLEVEL 1 goto err

rem ���� 2
%PROGRAM% 112 4 R > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% customcase2.txt
if ERRORLEVEL 1 goto err

echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1