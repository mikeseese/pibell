#!/bin/bash

# Install dependencies
apt-get update -q &&\
  apt-get install -yq \
    uv4l \
    uv4l-demos \
    uv4l-dummy \
    uv4l-mjpegstream \
    uv4l-raspicam \
    uv4l-raspicam-extras \
    uv4l-raspidisp \
    uv4l-server \
    uv4l-uvc \
    uv4l-xmpp-bridge \
    uv4l-xscreen \
    uv4l-webrtc$([ $(uname -m) = armv6l ] && echo -armv6) \
    vlc \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Disable uv4l_raspicam service which we'll manually start later
systemctl disable uv4l_raspicam

# Install pibell service
#systemctl disable pibell