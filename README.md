# volumio-plugin-helper
Simple bash script to install plugins from repo's.

## Lazy installation of unsanctioned versions
1. SSH into server
2. Execute the below command:
```
sudo wget -O volumio_install_from_zip.sh https://raw.githubusercontent.com/Saiyato/volumio-plugin-helper/master/volumio_install_from_zip.sh
```
This will download the installation script.

3. Execute the script (DO NOT USE sudo!) you've just downloaded

E.g. if you want the kodi plugin by Saiyato:
```
sh volumio_install_from_zip.sh Saiyato volumio-kodi-plugin
```

You can use this install script for any plugin (if they are hosted separately), just add $1 = author and $2 = repository.
For example this script will not work (unless you alter it) for plugins hosted in a volumio-plugins collection.

## Lazy installation of unsanctioned versions from a forked repo using a zip
1. SSH into server
```
sudo wget -O volumio_install_zip_from_fork.sh https://raw.githubusercontent.com/Saiyato/volumio-plugin-helper/master/volumio_install_zip_from_fork.sh
```
This will download the installation script

3. Execute the script (DO NOT USER sudo!) you've just downloaded

Parameters
$1 = author
$2 = category
$3 = plugin name
$4 = zip file name

E.g. if you want to install volspotconnect:
```
sh test.sh balbuze music_service volspotconnect volspotconnect
```
