# Volumio installer (workaround for fixes not in the Volumio repo)
# $1 = plugin name
if [ ! -d /home/volumio/$1 ];
then
	mkdir /home/volumio/$1
else
	rm -rf home/volumio/$1
	mkdir /home/volumio/$1
fi

echo "Downloading and extracting zip file..."
cd /home/volumio/$1
wget -O $1.zip https://github.com/Saiyato/$1/raw/master/$1.zip
miniunzip -xo $1.zip
rm $1.zip

echo "Installing plugin..."
volumio plugin install
echo "Done!"