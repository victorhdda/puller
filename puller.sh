#!/bin/bash

dst_path="/tmp/aa03/"

tmp_path="/tmp/aa02/"

echo starting script...
sleep 1

find /tmp/aa02 -delete


sleep 1
# Create temporary directory
mkdir "$tmp_path"

sleep 2
echo temporary directory created

# Destination folder should be empty
#Cloning github

echo Cloning repository

git clone git@github.com:victorhdda/blog.git /tmp/aa02/

wait

sleep 2

#mkdir "$dst_path" #dest_folder
#cd "$tmp_path"

#touch oi.txt
sleep 2
find "$tmp_path" -type f -name '*.md' | xargs -I '{}' cp {} "$dst_path" #dest_folder

#copiar imagens cp -R images/* folder/




sleep 2
cd "$dst_path"
echo cd..

sleep 1
rename 's/(\d{4})-(\d{2})-(\d{2})-//g' *.md

sleep 20
#sudo chmod a-rwx 2018-09-23-vpn.md - remove todas as permissões do arquivo
#sudo chmod a+r 2018-09-23-vpn.md  - adiciona permissões somente de leitura

#sudo chmod 644 -R folder/*



# sudo chmod 644 -R /tmp/aa02/folder/* change permission

sudo chmod 644 -R "$dst_path"*







exit
