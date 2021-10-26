# This image includes additional meta-packages such for desktop installations than offical image
FROM osrf/ros:melodic-desktop-full

# Change the default shell from /bin/sh to /bin/bash
SHELL ["/bin/bash","-c"]
ENV PORT 8080
ENV HOST 0.0.0.0

# 1. Install additinal pkgs
RUN apt-get -y update && apt-get install -y \
    gnutls-bin \
    vim \
    git \
    original-awk \
    python3-pip \
    libqt4-dev \
    libopencv-dev \
    liblua5.2-dev \
    screen \
    python3.8 \
    python3.8-dev \
    libpython3.6-dev \
    python3-catkin-pkg-modules \
    python3-rospkg-modules \
    python3-empy \
    python3-setuptools \
    libarmadillo-dev \

&& echo $'\n\
source /opt/ros/melodic/setup.sh' >> /root/.bashrc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
RUN apt-get install -y software-properties-common
RUN apt-get install wget




RUN apt-get install -y software-properties-common
RUN apt-get install wget


RUN git clone https://github.com/longdoank8/webapp2.git


#RUN mkdir bags #name folder like stated in frontend (von firebase)
#read out data from frontend put bags in bag directory
# set workdir, .py script should be there
#WORKDIR /arena-rosnav/arena_navigation/arena_local_planner/evaluation/scripts


WORKDIR /webapp2/scripts
RUN mkdir testbags
RUN pip3 install termcolor
RUN pip3 install importlib-resources
RUN pip3 install bagpy 
RUN pip3 install pyrebase
RUN pip3 install plot

RUN pip3 install \
    Flask \
    gunicorn  

#CMD ["python3", "server.py"]
#CMD ["python3", "download.py"]
CMD ["python3", "scenario_eval.py", "SRL_test.yml", "png"]
#CMD ["python3", "upload.py"]
CMD exec gunicorn --bind 0.0.0.0:8080 --workers 1 --threads 8 --timeout 0 scenario_eval:app