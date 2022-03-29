#!/usr/bin/bash

# Update and upgrade all packages
sudo apt-get update
sudo apt-get upgrade -y

# Install Python3, Pip3
sudo apt-get install -y python3
sudo apt-get install -y python3-pip

# Install Python2, Pip2
sudo apt-get install -y python2
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py
sudo python2 get-pip.py

# Install some wordlists/dictionnaries
sudo apt-get install -y seclists


######################
#       General
######################

sudo apt-get install -y hexedit


######################
#    Steganography
######################

# Stegsolve
wget http://www.caesum.com/handbook/Stegsolve.jar -O /tmp/stegsolve.jar
chmod +x /tmp/stegsolve.jar
mkdir /opt/stegsolve
mv /tmp/stegsolve.jar /opt/stegsolve/
ln -s /opt/stegsolve/stegsolve.jar /usr/local/bin/stegsolve

# LStegB
git clone https://github.com/x1mus/LStegB.git /tmp/LStegB
chmod +x /tmp/LStegB/LStegB.py
mv /tmp/LStegB /opt/
sudo ln -s /opt/LStegB/LStegB.py /usr/local/bin/LStegB

# Exiftool
sudo apt-get install -y exiftool

# Exif
sudo apt-get install -y exif

# Steghide
sudo apt-get install -y steghide

# Stegsnow
sudo apt-get install -y stegsnow

# Zsteg
sudo gem install zsteg

# Basecrack
git clone https://github.com/mufeedvh/basecrack.git /tmp/basecrack
chmod +x /tmp/basecrack/basecrack.py
sudo mv /tmp/basecrack /opt/
sudo ln -s /opt/basecrack/basecrack.py /usr/local/bin/basecrack


######################
#    Cryptography
######################



######################
#         Web
######################



######################
#    Networking
######################



######################
# Cracking / Reverse
######################