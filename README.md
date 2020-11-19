# docker-qgis-desktop
QGIS desktop


To run on UIO servers:

	xal=`exec xauth list $DISPLAY`

    docker run --rm --name="qgis-desktop-ltr" -i -t -e USER_NAME=$USER \
	-e USER_HOME=/home/$USER -e USER_XAUTH="$xal" --net=host -e DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix  -v $HOME:/home/$USER \
	--privileged=true  annefou/docker-qgis-desktop:latest

To share nfs filesystems, docker nfs plugin must be available. This must be done as root:
- Install docker plugin nfs on the server (to be done by root) and add it as a service

	wget https://github.com/ContainX/docker-volume-netshare/releases/download/v0.32/docker-volume-netshare_0.32_linux_amd64-bin

Version 0.33 did not work so we used version 32. Other users reported similar issues with version 0.33.

- start service docker-volume-netshare

	docker-volume-netshare nfs

Then users can use nfs mounted filesystems within their docker container:

	docker run --rm --name="qgis-desktop-ltr" -i -t -e USER_NAME=$USER \
	-e USER_HOME=/home/$USER -e USER_XAUTH="$xal" --net=host -e DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix  -v $HOME:/home/$USER \
	--volume-driver=nfs -v vann.uio.no/mn/vann/it-scratch:/data \
	--privileged=true  annefou/docker-qgis-desktop:latest
