# Volumio installer (workaround for plugins/fixes not in the Volumio repo) - download from forked repo
# $1 = author; $2 = category, $3 = plugin name, $4 = zip filename (optional)
ZIPFILE=${4-$3}
echo "Downloading $2/$3"
echo "Zip filename  = $ZIPFILE"
if [ ! -d /home/volumio/$3 ];
then
	mkdir /home/volumio/$3
else
	rm -rf home/volumio/$3
	mkdir /home/volumio/$3
fi

echo "Downloading and extracting zip file..."
cd /home/volumio/$3

URL=
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" ${URL})
if [ $HTTP_CODE == "404" ] ; then
    https://github.com/$1/volumio-plugins/raw/main/plugins/$2/$3/$ZIPFILE.zip
fi

wget -O $ZIPFILE.zip ${URL}
miniunzip -xo $ZIPFILE.zip
rm $ZIPFILE.zip

echo "Installing plugin..."
npm i
volumio plugin install
echo "Plugin installed successfully!"
