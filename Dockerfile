# Initial version of SASSE docker file. For now, tested only for creating confusion matrix. 
FROM python:3
# FROM tensorflow/tensorflow 

RUN mkdir /a
WORKDIR /a
# COPY apt.conf /etc/apt/apt.conf
RUN echo "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.lits
RUN apt-get update
RUN apt-get --allow-unauthenticated install -y wget libtiff5-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev python-gdal python3-gdal python3-numpy libgdal-dev libgdal1-dev
RUN pip install matplotlib opencv-python psycopg2-binary unicodecsv SQLAlchemy GeoAlchemy2 pyproj requests

RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O ~/miniconda.sh && \
chmod 775 ~/miniconda.sh && \
~/miniconda.sh -b && \
rm ~/miniconda.sh

RUN /root/anaconda3/bin/conda install -y gdal

# RUN rm -rf /root/.cache/matplotlib
# docker run --rm -v /smartdev/run/products/sasse/bin:/a sasse python xx.py
