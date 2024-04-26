@echo off

:inputPrompt
set /p inputFolder="Enter path to mod root directory (full path): "
IF "x%inputFolder%x" == "xx" goto inputPrompt
IF NOT EXIST "%inputFolder%" (
    echo Entered path is not an existing directory. Try again.
    goto inputPrompt
)
IF NOT EXIST "%inputFolder%\*" (
    echo Entered path is an existing file. Required path to directory. Try again.
    goto inputPrompt
)

:outputPrompt
set /p outputFolder="Enter path to packed geometry destanation (full path): "
IF "x%outputFolder%x" == "xx" goto outputPrompt


echo %inputFolder% "->" %outputFolder%
geometrypack.exe --verbose --tree %inputFolder% %outputFolder%
pause
