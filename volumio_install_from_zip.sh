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

apt-get update && apt-get install -f -y subversion build-essential

echo "Downloading and extracting zip file..."
cd /home/volumio/$2

BRANCH=master
if [! -z $3 ]; then
	BRANCH=$3
fi
URL=https://github.com/$1/$2/raw/$BRANCH/$2.zip
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" ${URL})
# Fix new top-level branch reference (master > main); the lazy way
if [ $HTTP_CODE == "404" ] ; then
        URL=https://github.com/$1/$2/raw/main/$2.zip
fi

wget -O $2.zip ${URL}

miniunzip -xo $2.zip
rm $2.zip

echo "Installing plugin..."
npm i
volumio plugin install
echo "Plugin installed successfully!"
