@echo off
echo Compiling Expense Splitter Java files...
echo.

cd WEB-INF\src

REM Set classpath - adjust paths as needed
set CLASSPATH=.;..\lib\servlet-api.jar;..\lib\mysql-connector-j-8.4.0.jar

REM Compile all Java files
javac -cp "%CLASSPATH%" -d ..\classes controller\*.java dao\*.java model\*.java util\*.java

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Compilation successful!
    echo Compiled classes are in WEB-INF\classes
) else (
    echo.
    echo Compilation failed! Please check:
    echo 1. MySQL JDBC driver is in WEB-INF\lib\
    echo 2. servlet-api.jar is in WEB-INF\lib\
    echo 3. All Java files are in correct packages
)

pause

