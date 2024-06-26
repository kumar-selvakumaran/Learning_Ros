FROM ubuntu:noble
# DIDNT USE THIS , JUST USE : image : osrf/ros:jazzy-desktop , https://hub.docker.com/layers/osrf/ros/jazzy-desktop/images/sha256-bb1e63cfe6e5ecd286f8f7e59cdd402ace8ab000f4d0e51c52d7a679e43a1155?context=explore
RUN apt update && apt install locales
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive && apt install -y software-properties-common

RUN apt update && apt install -y curl 
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RU apt update && sudo apt install -y \
  python3-flake8-blind-except \
  python3-flake8-class-newline \
  python3-flake8-deprecated \
  python3-mypy \
  python3-pip \
  python3-pytest \
  python3-pytest-cov \
  python3-pytest-mock \
  python3-pytest-repeat \
  python3-pytest-rerunfailures \
  python3-pytest-runner \
  python3-pytest-timeout \
  ros-dev-tools

# mkdir -p ~/ros2_jazzy/src
# cd ~/ros2_jazzy
# vcs import --input https://raw.githubusercontent.com/ros2/ros2/jazzy/ros2.repos src

# sudo apt upgrade

# sudo rosdep init
# rosdep update
# rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"

# cd ~/ros2_jazzy/
# colcon build --symlink-install

####################################################
# # Install Dependencies
# RUN apt-get update && apt-get install build-essential -y
# RUN apt-get install \
#     cmake git pkg-config libgtk-3-dev \
#     libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
#     libxvidcore-dev libx264-dev libjpeg-dev libpng-dev libtiff-dev \
#     gfortran openexr libatlas-base-dev python3-dev python3-numpy \
#     libtbb2 libtbb-dev libdc1394-22-dev -y
# # Create OPENCV on a layer
# RUN git clone https://github.com/opencv/opencv.git && \
#     git clone https://github.com/opencv/opencv_contrib.git && \
#     cd /opencv && git checkout 4.2.0 && \
#     cd /opencv_contrib && git checkout 4.2.0 && \
#     cd /opencv && \
#     mkdir build && \
#     cd /opencv/build && \
#     cmake -D CMAKE_BUILD_TYPE=RELEASE \
#         -D CMAKE_INSTALL_PREFIX=/usr/local .. \
#         -D INSTALL_C_EXAMPLES=ON \
#         -D INSTALL_PYTHON_EXAMPLES=ON \
#         -D OPENCV_GENERATE_PKGCONFIG=ON \
#         -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
#         -D BUILD_EXAMPLES=ON .. && \
#     make -j5 && make install && \
#     cd / && \
#     rm opencv -rf && \
#     rm opencv_contrib -rf

############### FURTHER SETUP INSTRUCTIONS #####################################################
 #  // TO COMPLETE SETUP RUN THE BELOW COMMAND AS WELL. FOR SOME REASON, IT CONTAINER THOWS <OPENCV_CORE cannot open shared object> error
# apt-get install -y scons libboost-all-dev 

# // DOCKER RUN COMMAND WITH VOLUMES, AND GUI FUNCTIONALITY.
# fOR WSL
# docker run -it -e DISPLAY=$DISPLAY    -v /tmp/.X11-unix:/tmp/.X11-unix    --network=host    --volume=/mnt/d/projects/ROS_learning/learning_ros/app:/app  --workdir=/app osrf/ros:jazzy-desktop /bin/bash
# FOR POWERSHELL
# docker run -it -e DISPLAY=$DISPLAY    -v /tmp/.X11-unix:/tmp/.X11-unix    --network=host    --volume=D:\NEU\semester_2\prcv_5330\opencv_setup\app:/app  --workdir=/app

# IF IT IS NOT WORKING, DOCKER DESKTOP IS PROBABLY NOT SWITCHED ON
##################################

# // CONFIGURE CPP_PROPERTIES.JSON TO ALLOW VSCODE TO DETECT HEADER FILES.
# edit c_cpp_properties.json.  i.e. : ctrl + shift + p -> edit c/c++ configuration.json -> add package paths in configurations["includePath"] 

############### compile and execute
# scons  //compilation
# ./test // execution (depending on the source code)
##################################################################################################