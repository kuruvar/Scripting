# Install tools:
sudo apt install wget lzip unzip squashfs-tools -y
sudo apt install snapd dkms software-properties-common python-software-properties -y
sudo apt install linux-headers-generic -y

# Install Anbox repository:
sudo add-apt-repository -y 'ppa:morphis/anbox-support'

# Install manually if not working
wget https://launchpad.net/~morphis/+archive/ubuntu/anbox-support/+files/anbox-modules-dkms_13_all.deb
sudo dpkg -i anbox-modules-dkms_13_all.deb

# Search and download updates:
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean

# Install DKMS package from PPA:
sudo modprobe ashmem_linux
sudo modprobe binder_linux

# Confirm:
ls -1 /dev/{ashmem,binder}

# Listing should be:
#    /dev/ashmem
#    /dev/binder

# Install Anbox Snap:
sudo snap install --devmode --beta anbox
sudo /snap/bin/anbox-installer

# Update Anbox:
snap refresh --beta --devmode anbox

# Check version:
snap info anbox

# restart PC:
sudo shutdown -r 0

# Script to install Play Store:
wget https://raw.githubusercontent.com/geeks-r-us/anbox-playstore-installer/master/install-playstore.sh
chmod +x install-playstore.sh
sudo ./install-playstore.sh
sudo ./install-playstore.sh --clean

# Execute Anbox:
anbox.appmgr

# If not load:
anbox session-manager

# Then go to Settings > Apps > Google Play Services > Permissions and enable all available permissions.

# If you are encountering some connectivity issues when logging in to your Google account on Anbox, make sure the anbox-bride.sh is running:

# to start it:
sudo /snap/anbox/current/bin/anbox-bridge.sh start

# to restart it:
sudo /snap/anbox/current/bin/anbox-bridge.sh restart

# Install SuperSU:
wget https://github.com/anbox/anbox/files/2376604/install-supersu-to-anbox.txt
mv install-supersu-to-anbox.txt install-supersu-to-anbox.sh
chmod +x install-supersu-to-anbox.sh
sudo ./install-supersu-to-anbox.sh
sudo ./install-supersu-to-anbox.sh --clean
