@echo off
setlocal EnableDelayedExpansion
set _THISDIR_=%~dp0
rem remove trailing back-slash
set _THISDIR_=!_THISDIR_:~,-1!
rem  transform to foward-slash
::~set "_THISDIR_=%_THISDIR_:\=/%"
pushd %_THISDIR_%
::cls


set _EXITCODE_=0
set _PYTHON_EXE=C:\Program Files\Python38\python.exe


set _CMD_="%_PYTHON_EXE%" "%~dpn0.py"
echo.Calling: %_CMD_%
%_CMD_%
if not [%ERRORLEVEL%] == [0] (
    set _EXITCODE_=%ERRORLEVEL%
)


goto :END
rem ----------------------------------------------------------------------------


rem   call :RESOLVE_PATH   WORKINGDIRPARENT   ".."
:RESOLVE_PATH
    set %1=%~dpfn2
goto:eof
rem ----------------------------------------------------------------------------


:END
::pause
popd
echo.ERRORLEVEL=%_EXITCODE_%
endlocal & set _EXITCODE_=%_EXITCODE_%
:: -call exit only in case of 
if not [%_EXITCODE_%]==[0] exit /b %_EXITCODE_%
