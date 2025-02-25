#!/bin/bash

echo "Creating Volumio alsacap debfile"

sudo apt-get update
sudo apt-get install -y autotools-dev automake libasound2-dev build-essential dpkg-dev file 

# Now checkinstall shall be installed. on arm simply do 
# apt-get install checkinstall
# for x64 do 
# wget http://ftp.us.debian.org/debian/pool/main/c/checkinstall/checkinstall_1.6.2+git20170426.d24a630-2~bpo10+1_amd64.deb && sudo dpkg -i checkinstall_1.6.2+git20170426.d24a630-2~bpo10+1_amd64.deb


./bootstrap
./configure
make
make dist

mkdir distfolder
tar xf alsacap-1.4.tar.gz -C distfolder

cd distfolder/alsacap-1.4/

./configure
make

sudo checkinstall -D make install

