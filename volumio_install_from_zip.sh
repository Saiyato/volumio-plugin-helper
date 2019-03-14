#!/bin/bash
# Volumio installer (workaround for plugins/fixes not in the Volumio repo)
# $1 = author; $2 = plugin name
if [ ! -d /home/volumio/$2 ];
then
	mkdir /home/volumio/$2
else
	rm -rf home/volumio/$2
	mkdir /home/volumio/$2
fi

apt-get update && apt-get install subversion build-essential

echo "Downloading and extracting zip file..."
cd /home/volumio/$2
wget -O $2.zip https://github.com/$1/$2/raw/master/$2.zip
miniunzip -xo $2.zip
rm $2.zip

echo "Installing plugin..."
npm i
volumio plugin install
echo "Plugin installed successfully!"
