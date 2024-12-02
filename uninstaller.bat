@echo off
REM Disable echo for a cleaner script but provide status updates using echo commands.
echo Starting uninstallation process...

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

REM Wait for device connection
echo Waiting for device to connect...
adb wait-for-device
if NOT %ERRORLEVEL%==0 (
    echo Device connection failed. Exiting...
    GOTO ERROR
)
echo Device connected successfully.

REM Remove xray binary
echo Removing xray binary from /usr/bin...
adb shell rm -f /usr/bin/xray
if NOT %ERRORLEVEL%==0 (
    echo Failed to remove xray binary.
)

REM Remove geoip.dat and geosite.dat from /cache
echo Removing geoip.dat and geosite.dat from /cache...
adb shell rm -f /cache/geoip.dat /cache/geosite.dat
if NOT %ERRORLEVEL%==0 (
    echo Failed to remove geoip.dat or geosite.dat.
)

REM Remove symbolic links for geoip.dat and geosite.dat
echo Removing symbolic links for geoip.dat and geosite.dat from /usr/bin...
adb shell rm -f /usr/bin/geoip.dat /usr/bin/geosite.dat
if NOT %ERRORLEVEL%==0 (
    echo Failed to remove symbolic links.
)

REM Remove configuration file
echo Removing config.json from /cache...
adb shell rm -f /cache/config.json
if NOT %ERRORLEVEL%==0 (
    echo Failed to remove config.json.
)

REM Remove startup script
echo Removing xray.sh from /etc/init.d...
adb shell rm -f /etc/init.d/xray.sh
if NOT %ERRORLEVEL%==0 (
    echo Failed to remove startup script.
)

REM Remove xray from system startup
echo Removing xray from system startup...
adb shell update-rc.d -f xray.sh remove
if NOT %ERRORLEVEL%==0 (
    echo Failed to remove xray from system startup.
)
REM Remove xray from system startup
echo Removing proxy.pac from /usr/zte_web/web/...
adb shell rm /usr/zte_web/web/proxy.pac
if NOT %ERRORLEVEL%==0 (
    echo Failed to remove xray from system startup.
)

REM Reboot the device to finalize uninstallation
echo Rebooting the device to finalize uninstallation...
adb shell reboot

REM Completion message
echo Uninstallation completed successfully. Press any key to close the window.
pause
exit 0

:ERROR
REM Handle errors
echo An error occurred during the uninstallation process. Please check the logs for details.
pause
exit 1
