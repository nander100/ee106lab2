# Start with ROS Noetic desktop-full as base image
FROM osrf/ros:noetic-desktop-full

# Set shell to bash
SHELL ["/bin/bash", "-c"]

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade
RUN apt-get update && \
    apt-get upgrade -y

# Source ROS setup in bashrc for all users
RUN echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc

# Install ROS development tools
RUN apt-get install -y \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential

# Initialize and update rosdep
RUN rosdep init || echo "rosdep already initialized" && \
    rosdep update

# Install Gazebo packages and Jackal simulation
RUN apt-get install -y \
    ros-noetic-gazebo-ros-pkgs \
    ros-noetic-gazebo-ros-control \
    ros-noetic-jackal-gazebo

# Set the working directory
WORKDIR /root/catkin_ws

# Source ROS setup on startup
CMD ["bash", "-c", "source /opt/ros/noetic/setup.bash && bash"]

# Start with NVIDIA CUDA + OpenGL base image (Ubuntu 20.04 compatible)
# FROM nvidia/opengl:1.2-glvnd-runtime-ubuntu20.04

# # Set shell to bash
# SHELL ["/bin/bash", "-c"]

# # Set non-interactive mode for apt
# ENV DEBIAN_FRONTEND=noninteractive

# # Install essential packages including gnupg
# RUN apt-get update && \
#     apt-get install -y gnupg2 curl lsb-release && \
#     apt-get upgrade -y

# # Add ROS Noetic package repository
# RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# # Update package lists after adding repository
# RUN apt-get update

# # Install ROS Noetic desktop-full
# RUN apt-get install -y ros-noetic-desktop-full

# # Install ROS development tools
# RUN apt-get install -y \
#     python3-rosdep \
#     python3-rosinstall \
#     python3-rosinstall-generator \
#     python3-wstool \
#     build-essential

# # Initialize and update rosdep
# RUN rosdep init || echo "rosdep already initialized" && \
#     rosdep update

# # Install Gazebo packages and Jackal simulation
# RUN apt-get install -y \
#     ros-noetic-gazebo-ros-pkgs \
#     ros-noetic-gazebo-ros-control \
#     ros-noetic-jackal-gazebo

# # Install additional GPU-related packages
# RUN apt-get install -y \
#     ros-noetic-rviz \
#     ros-noetic-rqt-* \
#     gazebo11-plugin-base

# # Source ROS setup in bashrc for all users
# RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

# # Set the working directory
# WORKDIR /root/catkin_ws

# # Create and initialize the catkin workspace
# RUN mkdir -p /root/catkin_ws/src && \
#     source /opt/ros/noetic/setup.bash && \
#     cd /root/catkin_ws && \
#     catkin_make

# # Now you can build with GPU flags
# RUN source /opt/ros/noetic/setup.bash && \
#     cd /root/catkin_ws && \
#     catkin_make -DCUDA_ENABLED=ON -DWITH_GPU=ON

# # Source ROS setup on startup
# CMD ["bash", "-c", "source /opt/ros/noetic/setup.bash && source /root/catkin_ws/devel/setup.bash && bash"]