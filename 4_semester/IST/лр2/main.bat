@echo off
cd mydir
rem 4.1
rd /S /Q ALL\A3\B3
md ALL\A1\B4
md ALL\A1\B5
rd /S /Q ALL\A2\B2
rem 4.2
copy ALL\first.txt ALL\A2\
ren ALL\A2\first.txt one.txt
rem 4.3
copy ALL\*txt ALL\A2\B1\C2\
rem 4.4
type ALL\A2\B1\C2\*.txt > ALL\A2\B1\C2\man.txt
type ALL\A2\B1\C2\man.txt
rem 4.5
copy ALL\A2\B1\C2\man.txt ALL\
rem 4.6
tree /a /f ALL
