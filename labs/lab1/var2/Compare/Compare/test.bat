@echo off
rem %1 - значение первого аргумента командной строки bat-файла (какой он есть)
rem %~1 - значение первого аргумента командной строки bat-файла с удалением обрамляющих кавычек (если они были)

rem Переменная PROGRAM будет хранить первый аргумент командной строки заключённый в кавычки
set PROGRAM="%~1"

set OUT="%TEMP%\out.txt"

rem При запуске без параметров ожидается ненулевой код возврата
%PROGRAM% > nul
if NOT ERRORLEVEL 1 goto err

rem проверяем сравнение с пустым файлом
%PROGRAM% < testempty1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% testempty1_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение 2 пустых файлов
%PROGRAM% < testempty2.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% testempty2_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение если одного из файлов нет
%PROGRAM% < testnothing1.txt > %OUT% 
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing1_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение если обоих файлов нет
%PROGRAM% < testnothing2.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing2_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение идентичных файлов в одну строку
%PROGRAM% < sameoneline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% sameoneline_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнеение идентичных файлов в несколько строки
%PROGRAM% < samemultiline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% samemultiline_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение не идентичных файлов в одну строку
%PROGRAM% < testnotsame1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame1_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение не идентичных файлов в несколько строк
%PROGRAM% < testnotsame2.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame2_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение не идентичных файлов одного в несколько строк и второго в одну строку
%PROGRAM% < testnotsame3.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame3_out.txt
if ERRORLEVEL 1 goto err


echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1