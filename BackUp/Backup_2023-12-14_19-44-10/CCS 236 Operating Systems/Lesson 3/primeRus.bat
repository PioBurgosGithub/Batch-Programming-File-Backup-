@echo off
setlocal enabledelayedexpansion
title Prime Number Checker

:menu
cls
echo ===========================================
echo           PRIME NUMBER CHECKER
echo        A SIMPLE BATCH SCRIPT PROGRAM   
echo ===========================================
echo Choose an option:
echo 1 - Check if a number is prime
echo 2 - Exit
set /P "choice=Enter your choice: "

if "%choice%" == "1" (
	goto input

) else if "%choice%"=="2" (
    echo Exiting...
    timeout /t 2 > nul
    exit
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 > nul
    goto menu
)

:input
cls
echo ===========================================
echo           PRIME NUMBER CHECKER
echo        A SIMPLE BATCH SCRIPT PROGRAM
echo ===========================================
set /p "input_number=Enter a number: "

rem echo Input: !input_number!
rem echo Match: !input_number! | findstr /r /c:"^[0-9][0-9 ]*$"

rem Check if the input is a positive integer
echo !input_number! | findstr /r /c:"^[0-9][0-9 ]*$" >nul

if errorlevel 1 (
  echo Invalid input. Please enter a positive integer.
  pause
  goto input
)

rem Special case for 1
if !input_number! LEQ 1 (
  echo Your input !input_number! is not a prime number.
  pause
  goto menu
)

rem Check for prime code block
set "isPrime=1"
for /l %%i in (2,1,!input_number!) do (
  if %%i lss !input_number! (
    set /a "remainder=input_number %% %%i"
    if !remainder! equ 0 (
      set "isPrime=0"
      goto result
    )
  )
)

:result
if !isPrime! equ 1 (
    cls
    echo ===========================================
    echo           PRIME NUMBER CHECKER
    echo        A SIMPLE BATCH SCRIPT PROGRAM
    echo ===========================================
    echo Your input !input_number! is a prime number.
    pause
    goto menu
) else (
    cls
    echo ===========================================
    echo           PRIME NUMBER CHECKER
    echo        A SIMPLE BATCH SCRIPT PROGRAM
    echo ===========================================
    echo Your input !input_number! is NOT a prime number.
    pause
    goto menu
)


