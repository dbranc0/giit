@ECHO OFF
:commitAll
git add .
git commit -m %2
EXIT /B 0

if %1=="commitall" CALL commitAll