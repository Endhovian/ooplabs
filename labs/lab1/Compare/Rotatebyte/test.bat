@echo off
rem %1 - значение первого аргумента командной строки bat-файла (какой он есть)
rem %~1 - значение первого аргумента командной строки bat-файла с удалением обрамл€ющих кавычек (если они были)

rem ѕеременна€ PROGRAM будет хранить первый аргумент командной строки заключЄнный в кавычки
set PROGRAM="%~1"

set OUT="%TEMP%\out.txt"

rem проверка базового кейса
%PROGRAM% 17 2 L > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% basictest.txt
if ERRORLEVEL 1 goto err

rem корректный тест 1
%PROGRAM% 7 1 L > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% customcase1.txt
if ERRORLEVEL 1 goto err

rem корректный тест 2
%PROGRAM% 112 4 R > %OUT%
if ERRORLEVEL 1 goto err
fc %OUT% customcase2.txt
if ERRORLEVEL 1 goto err

rem некорректный тест 1
%PROGRAM% 112 4 > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% failcase.txt
if ERRORLEVEL 1 goto err

rem некорректный тест 2
%PROGRAM% 112 > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% failcase.txt
if ERRORLEVEL 1 goto err

rem некорректный тест 3
%PROGRAM% > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% failcase.txt
if ERRORLEVEL 1 goto err



echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1