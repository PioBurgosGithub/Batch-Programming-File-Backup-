@echo off
setlocal enabledelayedexpansion

set /p number=Enter a number:

set "isPrime=true"
set /a "sqrtN=2"

if %number% leq 1 (
  set "isPrime=false"
) else if %number% gtr 2 (
  set /a "sqrtN=2"

  :checkLoop
  set /a "tempNum=number %% sqrtN"
  if !tempNum! == 0 (
    set "isPrime=false"
    goto primeCheckEnd
  )
  set /a "sqrtN+=1"
  set /a "sqrtN2=sqrtN * sqrtN"
  if !sqrtN2! leq !number! (
    goto checkLoop
  )
)

:primeCheckEnd
if "!isPrime!"=="true" (
  echo %number% is a prime number.
) else (
  echo %number% is not a prime number.
)

endlocal