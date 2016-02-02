
# add apt packages for ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# add apt keys for ROS
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

# update apt packages
sudo apt-get update

# install ROS 'indigo'
sudo apt-get install -y ros-indigo-desktop-full python-rosinstall

# init rosdep
sudo rosdep init

