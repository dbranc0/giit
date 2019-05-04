@ECHO OFF
:commitAll
git add .
git commit -m %2
EXIT /B 0

:pushCurrentBranch
SET %branch%="dev"
SET %remote%="origin"
git push origin %branch%
EXIT /B 0

:pushOtherBranch
SET %branch%="dev"
SET %remote%="origin"
git checkout %branch%
git push origin %branch%
EXIT /B 0

:merge
SET %from%=%2
SET %to%=%3
git checkout %from%
git merge %to%
git checkout %to%
git merge %from%
EXIT /B 0

if %1=="commitAll" CALL commitAll
if %1=="pushCurrent" CALL pushCurrentBranch
if %1=="pushOther" CALL pushOtherBranch
if %1=="merge" CALL merge