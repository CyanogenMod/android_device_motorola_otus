#!/system/bin/sh
system=`stml0xx getversion | cut -d"=" -f2 | cut -d"[" -f1`
hardware=`stml0xx getversion | cut -d"=" -f3 | cut -d"[" -f1`
TAG="stml0xx"

if [ "$system" -ge "$hardware" ]; then
	log -t$TAG "Filesystem sensor hub firmware newer than or same as hardware: $system vs $hardware"
else
	log -t$TAG "Downgrading sensor hub firmware from $hardware to $system"
	#Flush current version
	stml0xx tboot
fi
#Install file system version
stml0xx boot

