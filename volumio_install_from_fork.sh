#!/bin/bash
# Volumio installer (workaround for plugins/fixes not in the Volumio repo) - install directly from repo
mkdir /home/volumio/svn
cd /home/volumio/svn

echo "Install necessary packages..."
sudo apt-get install -y subversion build-essentials

# $1 = author, $2 = category, $3 = plugin name
echo "Downloading plugin from $1/volumio-plugins/plugins/$2/$3"
svn export https://github.com/$1/volumio-plugins.git/trunk/plugins/$2/$3

echo "Entering directory"
cd /home/volumio/svn/$3
ls -al

echo "Installing plugin..."
volumio plugin install
echo "Plugin installed successfully!"
