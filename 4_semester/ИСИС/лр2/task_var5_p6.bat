@echo off
echo.%~x1
md %~x1
set /p copy_name= "Copy files that starts with: "
FOR /R Variant5 %%G IN (%copy_name%*) DO xcopy %%G %~x1