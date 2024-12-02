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

REM Continue with the rest of the script
echo Pushing xray binary to /usr/bin...
adb push xray /usr/bin
timeout /t 1 >nul
echo Setting executable permissions for xray...
adb shell chmod +x /usr/bin/xray
timeout /t 1 >nul

echo Pushing geoip.dat to /cache...
adb push geoip.dat /cache
timeout /t 1 >nul
echo Setting executable permissions for geoip.dat...
adb shell chmod +x /cache/geoip.dat
timeout /t 1 >nul

echo Pushing geosite.dat to /cache...
adb push geosite.dat /cache
timeout /t 1 >nul
echo Setting executable permissions for geosite.dat...
adb shell chmod +x /cache/geosite.dat
timeout /t 1 >nul

echo Pushing config.json to /cache...
adb push config.json /cache/config.json
timeout /t 1 >nul

echo Creating symbolic link for geoip.dat in /usr/bin...
adb shell ln -s /cache/geoip.dat /usr/bin/geoip.dat
timeout /t 1 >nul
echo Creating symbolic link for geosite.dat in /usr/bin...
adb shell ln -s /cache/geosite.dat /usr/bin/geosite.dat
timeout /t 1 >nul

echo Creating proxy auto config file in /usr/zte_web/web...
adb push proxy.pac /usr/zte_web/web
adb shell chmod +x /usr/zte_web/web/proxy.pac
timeout /t 1 >nul

echo Pushing xray.sh to /etc/init.d...
adb push xray.sh /etc/init.d
timeout /t 1 >nul
echo Setting executable permissions for xray.sh...
adb shell chmod +x /etc/init.d/xray.sh
timeout /t 1 >nul
echo Adding xray.sh to system startup...
adb shell update-rc.d xray.sh defaults
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
