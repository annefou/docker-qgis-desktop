# docker-qgis-desktop
QGIS desktop


To run on UIO servers:

xal=`exec xauth list $DISPLAY`
docker run --rm --name="qgis-desktop-ltr" -i -t -e USER_NAME=$USER -e USER_HOME=/home/$USER -e USER_XAUTH="$xal" --net=host -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -v $HOME:/home/$USER --privileged=true  annefou/docker-qgis-desktop:1.0

