@ECHO OFF

if "%1"=="commitAll" GOTO commitAll
if "%1"=="pushCurrent" GOTO pushCurrentBranch
if "%1"=="pushOther" GOTO pushOtherBranch
if "%1"=="merge" GOTO merge
if "%1"=="devmerge" GOTO mergeToDev

GOTO :End

:commitAll
git add .
git commit -m %2
GOTO :EOF

:pushCurrentBranch
for /f "delims=" %%i in ('git branch') do SET branch="%%i"
SET branch=%branch:* ="%

for /f "delims=" %%i in ('git remote') do SET remote="%%i"

git push %remote% %branch%
GOTO :EOF

:pushOtherBranch
SET branch=%3
SET remote=%2
git push %remote% %branch%
GOTO :EOF

:merge
SET from=%2
SET to=%3
git checkout %to%
git merge %from%
GOTO :EOF

:mergeToDev
SET from=%2
SET to="dev"
git checkout %from%
git merge %to%
git checkout %to%
git merge %from%
GOTO :EOF

:End