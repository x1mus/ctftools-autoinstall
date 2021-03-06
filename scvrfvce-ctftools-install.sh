#!/usr/bin/bash

sudo clear # Get sudo permissions to not break the clean output

echo "====================================="
echo "      PRELIMINARY INSTALLATIONS      "
echo "====================================="

# Update all packages
echo -n "Running packages update........................."
sudo apt-get update &> /dev/null
echo "OK"

# Upgrade all packages
# echo -n "Running packages upgrade........................"
# sudo apt-get upgrade -y &> /dev/null
# echo "OK"

# Install Python3, Pip3
echo -n "Installing pip3................................."
sudo apt-get install -y python3-pip > /dev/null
echo "OK"

# Install Python2, Pip2
echo -n "Installing pip2................................."
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output /tmp/get-pip.py &> /dev/null
sudo python2 /tmp/get-pip.py &> /dev/null
echo "OK"

# Install some wordlists/dictionnaries
echo -n "Installing seclists............................."
sudo apt-get install -y seclists > /dev/null
echo "OK"

echo ""
echo "====================================="
echo "            GENERIC TOOLS            "
echo "====================================="

# Hexedit
echo -n "Installing hexedit.............................."
sudo apt-get install -y hexedit > /dev/null
echo "OK"

# Sublime Text 3
echo -n "Installing Sublime Text 3......................."
wget -O - https://download.sublimetext.com/sublimehq-pub.gpg -q | sudo gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/sublime-text.gpg --import &> /dev/null
sudo chmod 644 /etc/apt/trusted.gpg.d/sublime-text.gpg
sudo apt-get install -y apt-transport-https > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install -y sublime-text > /dev/null
echo "OK"


echo ""
echo "====================================="
echo "         STEGANOGRAPHY TOOLS         "
echo "====================================="

# Stegsolve
echo -n "Installing stegsolve............................"
mkdir /tmp/stegsolve
wget http://www.caesum.com/handbook/Stegsolve.jar -O /tmp/stegsolve/stegsolve.jar -q
touch /tmp/stegsolve/stegsolve.sh
cat > /tmp/stegsolve/stegsolve.sh << EOF
#!/bin/bash

java -jar /opt/stegsolve/stegsolve.jar
EOF
chmod +x /tmp/stegsolve/stegsolve.sh
sudo mv /tmp/stegsolve /opt/stegsolve/
sudo ln -s /opt/stegsolve/stegsolve.sh /usr/local/bin/stegsolve
echo "OK"

# LStegB
echo -n "Installing LStegB..............................."
git clone https://github.com/x1mus/LStegB.git /tmp/LStegB &> /dev/null
chmod +x /tmp/LStegB/LStegB.py
pip3 install -r /tmp/LStegB/requirements.txt &> /dev/null
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
pip3 install -r /tmp/basecrack/requirements.txt &> /dev/null
sudo mv /tmp/basecrack /opt/
sudo ln -s /opt/basecrack/basecrack.py /usr/local/bin/basecrack
echo "OK"


echo ""
echo "====================================="
echo "           FORENSICS TOOLS           "
echo "====================================="

# Volatility
echo -n "Installing volatility..........................."
sudo apt-get install -y build-essential libdistorm3-dev yara libraw1394-11 libcapstone-dev capstone-tool tzdata python2-dev libpq-dev &> /dev/null
pip2 install pycryptodome &> /dev/null
pip2 install setuptools &> /dev/null
pip2 install distorm3==3.4.4 &> /dev/null
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
sleep 0.2
chmod +x /tmp/voladpro/voladpro.sh
sleep 0.2
sudo mv /tmp/voladpro /opt/
sleep 0.2
sudo ln -s /opt/voladpro/voladpro.sh /usr/local/bin/voladpro
sleep 0.2
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


echo ""
echo "====================================="
echo "            REVERSE TOOLS            "
echo "====================================="

# IDA
echo -n "Installing IDA.................................."
#wget https://out7.hex-rays.com/files/idafree77_linux.run -q -O /tmp/ida.run
#chmod +x /tmp/ida.run
echo "NOK"

# Ghidra
echo -n "Installing ghidra..............................."
sudo apt install openjdk-11-jdk &> /dev/null
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.2_build/ghidra_10.1.2_PUBLIC_20220125.zip -q -O /tmp/ghidra.zip
unzip /tmp/ghidra.zip -d /tmp/ > /dev/null
mv /tmp/ghidra_10.1.2_PUBLIC /opt/ghidra
sudo ln -s /opt/ghidra/ghidraRun /usr/local/bin/ghidra
echo "OK"

######################
#    pwn
######################