#!/usr/bin/bash

echo "====================================="
echo "      PRELIMINARY INSTALLATIONS      "
echo "====================================="

# Update all packages
echo -n "Running packages update........................."
sudo apt-get update
echo "OK"

# Upgrade all packages
echo -n "Running packages upgrade........................"
sudo apt-get upgrade -y
echo "OK"

# Install Python3, Pip3
echo -n "Installing python3 and pip3....................."
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
echo "OK"

# Install Python2, Pip2
echo -n "Installing python2 and pip2....................."
sudo apt-get install -y python2
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py
sudo python2 get-pip.py
echo "OK"

# Install some wordlists/dictionnaries
echo -n "Installing seclists............................."
sudo apt-get install -y seclists
echo "OK"


######################
#       General
######################

echo "====================================="
echo "            GENERIC TOOLS            "
echo "====================================="

echo -n "Installing hexedit.............................."
sudo apt-get install -y hexedit
echo "OK"


######################
#    Steganography
######################

echo "====================================="
echo "         STEGANOGRAPHY TOOLS         "
echo "====================================="

# Stegsolve
echo -n "Installing stegsolve............................"
wget http://www.caesum.com/handbook/Stegsolve.jar -O /tmp/stegsolve.jar
chmod +x /tmp/stegsolve.jar
mkdir /opt/stegsolve
mv /tmp/stegsolve.jar /opt/stegsolve/
ln -s /opt/stegsolve/stegsolve.jar /usr/local/bin/stegsolve
echo "OK"

# LStegB
echo -n "Installing LStegB..............................."
git clone https://github.com/x1mus/LStegB.git /tmp/LStegB
chmod +x /tmp/LStegB/LStegB.py
mv /tmp/LStegB /opt/
sudo ln -s /opt/LStegB/LStegB.py /usr/local/bin/LStegB
echo "OK"

# Exiftool
echo -n "Installing exiftool............................."
sudo apt-get install -y exiftool
echo "OK"

# Exif
echo -n "Installing exif................................."
sudo apt-get install -y exif
echo "OK"

# Steghide
echo -n "Installing steghide............................."
sudo apt-get install -y steghide
echo "OK"

# Stegsnow
echo -n "Installing stegsnow............................."
sudo apt-get install -y stegsnow
echo "OK"

# Zsteg
echo -n "Installing zsteg................................"
sudo gem install zsteg
echo "OK"

# Basecrack
echo -n "Installing basecrack............................"
git clone https://github.com/mufeedvh/basecrack.git /tmp/basecrack
chmod +x /tmp/basecrack/basecrack.py
sudo mv /tmp/basecrack /opt/
sudo ln -s /opt/basecrack/basecrack.py /usr/local/bin/basecrack
echo "OK"


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