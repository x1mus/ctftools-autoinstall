#!/usr/bin/bash


echo "====================================="
echo "      PRELIMINARY INSTALLATIONS      "
echo "====================================="

# Update all packages
echo -n "Running packages update........................."
sudo apt-get update &> /dev/null
echo "OK"

# Upgrade all packages
echo -n "Running packages upgrade........................"
sudo apt-get upgrade -y &> /dev/null
echo "OK"

# Install Python3, Pip3
echo -n "Installing python3 and pip3....................."
sudo apt-get install -y python3 > /dev/null
sudo apt-get install -y python3-pip > /dev/null
echo "OK"

# Install Python2, Pip2
echo -n "Installing python2 and pip2....................."
sudo apt-get install -y python2 > /dev/null
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py &> /dev/null
sudo python2 /tmp/get-pip.py &> /dev/null
echo "OK"

# Install some wordlists/dictionnaries
echo -n "Installing seclists............................."
sudo apt-get install -y seclists > /dev/null
echo "OK"

echo""
echo "====================================="
echo "            GENERIC TOOLS            "
echo "====================================="

# Hexedit
echo -n "Installing hexedit.............................."
sudo apt-get install -y hexedit > /dev/null
echo "OK"

# Sublime Text 3
echo -n "Installing Sublime Text 3......................."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - &> /dev/null
sudo apt-get install -y apt-transport-https > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update > /dev/null
sudo apt-get install -y sublime-text > /dev/null
echo "OK"

echo""
echo "====================================="
echo "         STEGANOGRAPHY TOOLS         "
echo "====================================="

# Stegsolve
echo -n "Installing stegsolve............................"
wget http://www.caesum.com/handbook/Stegsolve.jar -O /tmp/stegsolve.jar -q
chmod +x /tmp/stegsolve.jar
sudo mkdir /opt/stegsolve
sudo mv /tmp/stegsolve.jar /opt/stegsolve/
sudo ln -s /opt/stegsolve/stegsolve.jar /usr/local/bin/stegsolve
echo "OK"

# LStegB
echo -n "Installing LStegB..............................."
git clone https://github.com/x1mus/LStegB.git /tmp/LStegB &> /dev/null
chmod +x /tmp/LStegB/LStegB.py
sudo mv /tmp/LStegB /opt/
sudo ln -s /opt/LStegB/LStegB.py /usr/local/bin/LStegB
echo "OK"

# Exiftool
echo -n "Installing exiftool............................."
sudo apt-get install -y exiftool > /dev/null
echo "OK"

# Exif
echo -n "Installing exif................................."
sudo apt-get install -y exif > /dev/null
echo "OK"

# Steghide
echo -n "Installing steghide............................."
sudo apt-get install -y steghide > /dev/null
echo "OK"

# Stegsnow
echo -n "Installing stegsnow............................."
sudo apt-get install -y stegsnow > /dev/null
echo "OK"

# Zsteg
echo -n "Installing zsteg................................"
sudo gem install zsteg > /dev/null
echo "OK"

# Basecrack
echo -n "Installing basecrack............................"
git clone https://github.com/mufeedvh/basecrack.git /tmp/basecrack &> /dev/null
chmod +x /tmp/basecrack/basecrack.py
sudo mv /tmp/basecrack /opt/
sudo ln -s /opt/basecrack/basecrack.py /usr/local/bin/basecrack
echo "OK"


echo""
echo "====================================="
echo "           FORENSICS TOOLS           "
echo "====================================="

# Volatility
echo -n "Installing volatility..........................."
sudo apt-get install -y build-essential git libdistorm3-dev yara libraw1394-11 libcapstone-dev capstone-tool tzdata python2-dev > /dev/null
pip2 install pycryptodome > /dev/null
pip2 install distorm3==3.4.4 > /dev/null
git clone https://github.com/volatilityfoundation/volatility.git /tmp/volatility &> /dev/null
chmod +x /tmp/volatility/vol.py
sed -i "1 s|$|2|" "/tmp/volatility/vol.py"
sudo mv /tmp/volatility /opt/
sudo ln -s /opt/volatility/vol.py /usr/local/bin/volatility
echo "OK"

# Voladpro
echo -n "Installing voladpro............................."
mkdir /tmp/voladpro/
touch /tmp/voladpro/voladpro.sh
cat > /tmp/voladpro/voladpro.sh << EOF
#!/bin/bash

echo -e "Volatility Add Profile v0.0.1"

display_usage() {
    echo -e "\nUsage: voladpro linux [profile]        Specify the profile to be GNU-Linux based"
    echo -e "   or: voladpro mac [profile]        Specify the profile to be Mac OS based"
    echo -e "   or: voladpro windows [profile]    Specify the profile to be Windows based"
    echo -e "\nProfile:"
    echo -e "   Path to the profile file to add"
}

if [[ (\$1 == "--help") || (\$1 == "-h") ]]; then
    display_usage
    exit 0
fi

if [ \$# -le 1 ]; then
    echo "OS and profile are required!"
    display_usage
    exit 1
fi

if [[ \$1 != "linux" && \$1 != "windows" && \$1 != "mac" ]]; then
    echo "Profile must be linux, mac or windows"
    display_usage
    exit 1
fi

if [ ! -f \$2 ]; then
    echo "File not found"
    exit 1
fi

if [[ "\$EUID" -ne 0 ]]; then
    echo "This script must be run with root privileges."
    exit 1
fi

if [ \$1 == "linux" ]; then
    mv \$2 /opt/volatility/volatility/plugins/overlays/linux/
elif [ \$1 == "mac" ]; then
    mv \$2 /opt/volatility/volatility/plugins/overlays/mac/
elif [ \$1 == "windows" ]; then
    mv \$2 /opt/volatility/volatility/plugins/overlays/windows/
fi

echo "Profile successfully added to volatility"
EOF
chmod +x /tmp/voladpro/voladpro.sh
sudo mv /tmp/voladpro /opt/
sudo ln -s /opt/voladpro/voladpro.sh /usr/local/bin/voladpro
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