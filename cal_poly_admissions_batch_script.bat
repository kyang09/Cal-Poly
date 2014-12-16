::CMD Batch Script for Cal Poly Admissions Selection Criteria
::Converts all spaces in Subdirectories and Files to underscore
::Creates list of that directory with new names
::Extracts all HTML files from each directory, and copies it to My Documents under a folder with the college name
::Written by Kevin Tomiyoshi Yang
::Check out my website at http://www.thecupnote.com
@echo off
setlocal
for /r "%~1" %%t in (.) do (
    set dirName=%~1
   for /f "usebackq tokens=*" %%f in (`dir /b/a-d "%%~t" 2^>nul:`) do (
      call :proc "%%~f" "%%~t"
   )
   for /f "usebackq tokens=*" %%d in (`dir /b/ad "%%~t" 2^>nul:`) do (
      call :proc "%%~d" "%%~t"
   )
)
set dirName=%dirName:~-22%
md C:\Users\%USERNAME%\Documents\htmls_%dirName%\
dir /b %~1 > C:\Users\%USERNAME%\Documents\htmls_%dirName%\_directory_%dirName%_.list
COLOR 0E
echo . & echo .
echo ________________________________________________________________________________
echo A list of the new directory names has been created in the new folder created
echo File name: _directory_blah_blah.list
echo Open it with Notepad or Notepad++
echo ________________________________________________________________________________
echo . & echo .
pause /b 0
COLOR 0A
echo . & echo .
echo --------------------------------------------------------------------------------
echo Do you want to copy all HTML files to your Documents under \ all_html \
echo 1 for YES, 2 for NO
echo --------------------------------------------------------------------------------
echo . & echo .
@CHOICE /C:12
IF ERRORLEVEL 2 GOTO no
IF ERRORLEVEL 1 GOTO yes
GOTO end
:yes
for /R C:\Users\%USERNAME%\Documents\College_of_Agriculture %%f in (*.html) do copy %%f C:\Users\%USERNAME%\Documents\htmls_%dirName%\
GOTO end
:no
ECHO Thank you for using this program!
:end
@PAUSE
COLOR 07
exit /b 0
:proc
   set fn=%~1
   if "%fn: =_%"=="%fn%" exit /b 0
   set fn=%~2\%fn: =_%
   move "%~2\%~1" "%fn%" >nul:
exit /b 0

:copyDirFiles
    for /R C:\Users\kyang09\Documents\College_of_Agriculture %%f in (*.html) do copy %%f C:\Users\kyang09\Documents\test\
    exit /b 0