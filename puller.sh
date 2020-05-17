#!/bin/bash

tmp_path=$1
dst_path=$2
#dst_images=$3

echo $tmp_path
echo $dst_path


sleep 2
#dst_path="/tmp/aa03/"
#tmp_path="/tmp/aa02/"

echo starting script...
sleep 1
# Delete and create directories

sudo find "$tmp_path""/" -delete
sudo find "$dst_path""/" -delete

sleep 1

sleep 3
mkdir "$tmp_path"
mkdir -p "$dst_path"
mkdir -p "$dst_path""/images"
mkdir -p "$dst_path""/_posts"


sleep 1
echo temporary directories created

# Destination folder should be empty
#Cloning github

echo Cloning repository...

sleep 1

git clone https://github.com/victorhdda/blog.git $tmp_path"/"

wait

sleep 2

#mkdir "$dst_path" #dest_folder
#cd "$tmp_path"

#touch oi.txt
#sleep 2
find "$tmp_path""/" -type f -name '*.md' | xargs -I '{}' cp {} "$dst_path""/_posts" #dest_folder

#copiar imagens cp -R images/* folder/



sleep 2
cd "$dst_path""/_posts"
echo cd..

#sleep 1
rename 's/(\d{4})-(\d{2})-(\d{2})-//g' *.md

sleep 2
#sudo chmod a-rwx 2018-09-23-vpn.md - remove todas as permissões do arquivo
#sudo chmod a+r 2018-09-23-vpn.md  - adiciona permissões somente de leitura

#sudo chmod 644 -R folder/*



# sudo chmod 644 -R /tmp/aa02/folder/* change permission

#Mover imagens

#path posts: /home/vh/Blog/source/_posts

#path images: /home/vh/Blog/source/images

#cp -R -v "$tmp_path"/images/* ""$dst_path" ../images"

echo "$pwd"
cp -R -v "$tmp_path"/images/* "$dst_path""/images"



sudo chmod 644 -R "$dst_path""/images/"*
sudo chmod 644 -R "$dst_path""/_posts/"*

# Ajustar permissões dos arquivos transferidos.


exit


#comentar código

#Substituir caminhos por variáveis

#/home/vh/Blog/source
#/home/vh/Blog/source/_posts
#/home/vh/Blog/source/images


# a pasta é um hiperlink? pq não dá para criar o caminha do nome com _ ?
