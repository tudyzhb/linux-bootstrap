#!/bin/bash
# https://rpmfusion.org/Configuration/
yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm
yum install -y ffmpeg.x86_64 ffmpeg-libs.x86_64 ffmpeg-devel.x86_64
