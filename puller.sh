#!/bin/bash
#Receive parameters from commandline
tmp_path=$1
dst_path=$2

#Commented codes can be uncommented in case of debug
#echo $tmp_path
#echo $dst_path

echo Starting script...

# Delete and create directories
sudo find "$tmp_path""/" -delete
sudo find "$dst_path""/" -delete

mkdir "$tmp_path"
#mkdir -p "$dst_path"
mkdir -p "$dst_path""/images"
mkdir -p "$dst_path""/_posts"

echo Temporary directories created

#Cloning github. Destination folder should be empty

echo Cloning repository...
git clone https://github.com/victorhdda/blog.git $tmp_path"/"
wait

#cd "$tmp_path"

#Copy of posts to destination path
find "$tmp_path""/" -type f -name '*.md' | xargs -I '{}' cp {} "$dst_path""/_posts"

# cd path to rename posts
cd "$dst_path""/_posts"
echo cd..
#Rename posts
rename 's/(\d{4})-(\d{2})-(\d{2})-//g' *.md

#echo "$pwd"
#Copy images to destination path
cp -R -v "$tmp_path"/images/* "$dst_path""/images"

#Change FilePermissions
sudo chmod 644 -R "$dst_path""/images/"*
sudo chmod 644 -R "$dst_path""/_posts/"*

exit

#Local paths
#/home/user/Blog/source
#/home/user/Blog/source/_posts
#/home/user/Blog/source/images
