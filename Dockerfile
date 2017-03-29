FROM ubuntu:16.04
MAINTAINER IT-DRIFT UIO <drift@geo.uio.no>

RUN echo "deb http://qgis.org/debian xenial main\n" >> /etc/apt/sources.list
RUN echo "deb-src http://qgis.org/debian xenial main\n" >> /etc/apt/sources.list

RUN    apt-get -y update
RUN    apt-get -y --allow-unauthenticated install xauth qgis python-qgis qgis-plugin-grass grass grass-doc grass-gui saga
RUN    apt-get -y --allow-unauthenticated install python-requests python-numpy python-pandas python-scipy python-matplotlib

RUN    apt-get clean \
    && apt-get purge

# Called when the Docker image is started in the container
ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD /start.sh
