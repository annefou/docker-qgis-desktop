#!/bin/bash

# Put any tasks you would like to have carried
# out when the container is first created here

# USER_XAUTH, USER_NAME and USER_HOME are environment variables
# passed to the container

USER_ID=`ls -lahn $USER_HOME | tail -n 1 |  awk {'print $3'}`
GROUP_ID=`ls -lahn $USER_HOME | tail -n 1 |  awk {'print $4'}`

groupadd -g $GROUP_ID qgis
useradd --shell /bin/bash --uid $USER_ID --gid $GROUP_ID $USER_NAME
xauth add $USER_XAUTH
su $USER_NAME -c "/usr/bin/qgis"

