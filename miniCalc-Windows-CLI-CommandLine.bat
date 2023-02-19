@echo off
title miniCalc

:main
cls
echo.
echo *** miniCalc ***
echo.
set /p num1=Enter first number: 
set /p op=Enter operator (+, -, *, /): 
set /p num2=Enter second number: 

if "%op%"=="" (
    echo Error: operator not specified.
    pause
    goto main
)

if "%op%"=="+" (
    set /a result=%num1% + %num2%
) else if "%op%"=="-" (
    set /a result=%num1% - %num2%
) else if "%op%"=="*" (
    set /a result=%num1% * %num2%
) else if "%op%"=="/" (
    if "%num2%"=="0" (
        echo Error: division by zero.
        pause
        goto main
    ) else (
        set /a result=%num1% / %num2%
    )
) else (
    echo Error: invalid operator.
    pause
    goto main
)

echo.
echo %num1% %op% %num2% = %result%
echo.
pause
goto main
