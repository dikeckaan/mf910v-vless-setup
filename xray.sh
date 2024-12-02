#!/bin/sh
### BEGIN INIT INFO
# Provides:          xray
# Required-Start:    $network
# Required-Stop:     $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start Xray Core
# Description:       Starts Xray Core on system boot
### END INIT INFO

XRAY_EXEC=/usr/bin/xray
CONFIG_FILE=/cache/config.json

start() {
    echo "Starting Xray Core..."
    $XRAY_EXEC -config $CONFIG_FILE &
    echo $! > /var/run/xray.pid
    echo "Xray started."
}

stop() {
    echo "Stopping Xray Core..."
    if [ -f /var/run/xray.pid ]; then
        kill "$(cat /var/run/xray.pid)"
        rm -f /var/run/xray.pid
        echo "Xray stopped."
    else
        echo "Xray is not running."
    fi
}

restart() {
    echo "Restarting Xray Core..."
    stop
    start
}

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  *)
    echo "Usage: /etc/init.d/xray {start|stop|restart}"
    exit 1
    ;;
esac

exit 0
