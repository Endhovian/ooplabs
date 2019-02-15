@echo off
rem %1 - значение первого аргумента командной строки bat-файла (какой он есть)
rem %~1 - значение первого аргумента командной строки bat-файла с удалением обрамляющих кавычек (если они были)

rem Переменная PROGRAM будет хранить первый аргумент командной строки заключённый в кавычки
set PROGRAM="%~1"

set OUT="%TEMP%\out.txt"

rem проверяем передачу 1 параметра
%PROGRAM% empty1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% invalidareguments_out.txt
if ERRORLEVEL 1 goto err

rem проверяем без передачи параметром
%PROGRAM% > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% invalidareguments_out.txt
if ERRORLEVEL 1 goto err

rem проверяем передачу 4 параметров
%PROGRAM% empty1.txt notsame1multiline.txt empty2.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc %OUT% invalidareguments_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение 2 пустых файлов
%PROGRAM% empty1.txt empty2.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% testempty2_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение если одного из файлов нет
%PROGRAM% simpletxt1.txt empty.txt > %OUT% 
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing1_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение если обоих файлов нет
%PROGRAM% simpletxt2.txt simpletxt1.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnothing2_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение идентичных файлов в одну строку 
%PROGRAM% same1oneline.txt same2oneline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% sameoneline_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнеение идентичных файлов в несколько строки
%PROGRAM% same1multiline.txt same2multiline.txt > %OUT%
if ERRORLEVEL 1 goto err
fc.exe %OUT% samemultiline_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение не идентичных файлов в одну строку
%PROGRAM% notsame1oneline.txt same1oneline.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame1_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение не идентичных файлов в несколько строк
%PROGRAM% notsame1multiline.txt same1multiline.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame2_out.txt
if ERRORLEVEL 1 goto err

rem проверяем сравнение не идентичных файлов одного в несколько строк и второго в одну строку
%PROGRAM% notsame1multiline.txt notsame1oneline.txt > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testnotsame3_out.txt
if ERRORLEVEL 1 goto err


rem проверка файлов из замечания
%PROGRAM% Compare1.cpp Compare2.cpp > %OUT%
if NOT ERRORLEVEL 1 goto err
fc.exe %OUT% testcompare_out.txt
if ERRORLEVEL 1 goto err

echo Program testing succeeded
exit 0

:err
echo Program testing failed
exit 1