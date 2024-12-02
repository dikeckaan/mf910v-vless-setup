@echo off
REM Disable echo for a cleaner script but provide status updates using echo commands.

REM Set the router address
set ADDR=192.168.0.1

echo Trying to connect to the router...
curl --connect-timeout 5 "http://%ADDR%/goform/goform_set_cmd_process?isTest=false&goformId=LOGIN&password=YWRtaW4=" -H "Referer: http://%ADDR%/index.html" >nul:
REM curl --connect-timeout 5 "http://%ADDR%/goform/goform_set_cmd_process?isTest=false&goformId=LOGIN&password=dHVya3RlbGVrb20=" -H "Referer: http://%ADDR%/index.html" >nul:

if NOT %ERRORLEVEL%==0 (
    echo Failed to connect to the router. Exiting...
    GOTO ERROR
)
echo Successfully connected to the router.

echo Switching USB composition...
curl --connect-timeout 5 "http://%ADDR%/goform/goform_set_cmd_process?isTest=false&goformId=USB_MODE_SWITCH&usb_mode=6" -H "Referer: http://%ADDR%/index.html"
if NOT %ERRORLEVEL%==0 (
    echo Failed to switch USB composition. Exiting...
    GOTO ERROR
)

echo Waiting for device to connect...
adb wait-for-device
if NOT %ERRORLEVEL%==0 (
    echo Device connection failed. Exiting...
    GOTO ERROR
)
echo Device connected successfully.
echo Please wait...

echo Old config.json removing
adb shell rm /cache/config.json
echo Pushing new config.json to /cache...
adb push config.json /cache/config.json
timeout /t 1 >nul

echo Rebooting the device to apply changes...
adb shell reboot

REM Handle errors
:ERROR
echo An error occurred during the script execution. Please check the logs for details.
pause
exit /b 1

REM Completion message
echo Script execution completed. Press any key to close the window.
pause
