#!/bin/bash

source ./set_option.sh

CONF_DIR=/opt/pibell/config/
CONF_FILE=${CONF_DIR}uv4l.conf

# Reconfigure uv4l.conf
set_option text-filename ${CONF_DIR}text.json ${CONF_FILE}

# Resin environment variables
set_option height ${height} ${CONF_FILE}
set_option width ${width} ${CONF_FILE}
set_option framerate ${framerate} ${CONF_FILE}
set_option rotation ${rotation} ${CONF_FILE}

# Reconfigure the UV4L service
sed -i "s^/etc/uv4l/uv4l-raspicam.conf^${CONF_FILE}^g" /etc/init.d/uv4l_raspicam

cat /etc/init.d/uv4l_raspicam
ls -l /dev/video*

# Start UV4L
echo "Starting UV4l"
systemctl start uv4l_raspicam