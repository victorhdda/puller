# puller


What I need:

- pull a git project from a static url periodic: git@github.com:victorhdda/blog.git - OK
- rename and move specific files to a new local folder: all .md - OK
- add specific permissions to these files: -rw-r--r-- - OK
- create a cron job for executions

Solutions:
- create a cron job that executes these scripts periodic
- git puller - OK
- files move and change permission

find /tmp/aa02/ -type f -name '*.md' | xargs -I '{}' cp {} /tmp/aa02/folder

 rename -n 's/(\d{4})-(\d{2})-(\d{2})-//g' *


















## References

https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/


find
https://stackoverflow.com/questions/22388480/how-to-pipe-the-results-of-find-to-mv-in-linux



#REGEX - rename

https://www.cyberciti.biz/faq/linux-rename-file/

https://www.rexegg.com/regex-quickstart.html


https://serverfault.com/questions/5685/renaming-files-in-linux-with-a-regex



chmod

https://www.december.com/unix/ref/chmod.html
https://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x9543.htm
https://help.ubuntu.com/community/FilePermissions

https://unix.stackexchange.com/questions/49263/recursive-mkdir


movi files

https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-move-directory-uponelevel/


TAR

https://www.cyberciti.biz/faq/how-do-i-compress-a-whole-linux-or-unix-directory/
https://stackoverflow.com/questions/18402395/how-to-uncompress-a-tar-gz-in-another-directory

cron
https://crontab.guru/
https://askubuntu.com/questions/13730/how-can-i-schedule-a-nightly-reboot

docker

https://docs.docker.com/engine/reference/commandline/docker/

https://docs.docker.com/engine/reference/commandline/restart/
