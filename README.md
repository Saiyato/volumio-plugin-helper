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

You can use this install script for any plugin, just add $1 = author and $2 = repository.