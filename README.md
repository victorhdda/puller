# Puller - a git pull script to update a blog server


### What is needed:

- Pull a git project from a static url periodically and update a blog content; :white_check_mark:
- Rename and move specific files to a new local folder; :white_check_mark:
- Add specific permissions to files (`-rwxr--r--`) and folders (`drwxr-xr-x`); :white_check_mark:
- Attach the execution of this script to a cron job. :white_check_mark:

### Solutions:
- It was created a script to process temporary and destination folders; clone remote public github repository; copy and rename contents do desired paths and change permissions.
- Also was created a cron job that executes this scripts periodically.


### Learned lessons

##### Find

The code above search for valid files from a specific name pattern and copy then to a new path.

```sh
find /tmp/aa02/ -type f -name '*.md' | xargs -I '{}' cp {} /tmp/aa02/folder
```

A safe way to delete files is to use the command `find` with the parameter `-delete`:

```sh
find /path/to/folder -delete
```

#### Rename

The command `rename` could be very useful associated to REGEX expressions. In the command above it is filtered preexistent date pattern in the filename.

```sh
rename -n 's/(\d{4})-(\d{2})-(\d{2})-//g' *
```

Execution:

```sh
user@pc:/tmp/folder$ rename -n 's/(\d{4})-(\d{2})-(\d{2})-//g' *
rename(2018-09-19-about.md, about.md)
rename(2018-09-19-ansible.md, ansible.md)
rename(2018-09-19-hexo-ferramentas-texto.md, hexo-ferramentas-texto.md)
rename(2018-09-23-vpn.md, vpn.md)
rename(2018-09-24-chmod.md, chmod.md)
rename(2018-09-24-kvm.md, kvm.md)
rename(2020-05-16-parallel.md, parallel.md)
```
The parameter `-n` shows what will be renamed, if removed, the command execute the change.


#### Cron

At the web server was configured a cron job to run the script periodically. The added line to `crontab -e` was:

```
* */1 * * * /path/to/script/folder/puller.sh /tmp/folder /dst/folder/; sudo docker restart id_of_the_container
```
Every hour the task runs automatically.


#### Docker

As the web server runs in a Docker container, it is necessary to restart that execution after those folders and files change.

The command `sudo docker restart id_of_the_container` at the cron job do that.

To identify the id of the running container is used the command

```sh
user@pc:~$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
id212132        davyyy/hexo         "/root/entrypoint.sh…"   20 months ago       Up 43 minutes       0.0.0.0:4000->4000/tcp   hexo-server
```

With all this process the main objective was achieved and now is possible to link a web server to a git repository automatically. :smile:


## References

- Linux and files change
  - <https://www.tecmint.com/permanently-and-securely-delete-files-directories-linux/>
  - <https://www.december.com/unix/ref/chmod.html
https://tldp.org/LDP/GNU-Linux-Tools-Summary/html/x9543.htm>
  - <https://help.ubuntu.com/community/FilePermissions>
  - <https://unix.stackexchange.com/questions/49263/recursive-mkdir>
  - <https://www.cyberciti.biz/faq/linux-unix-appleosx-bsd-move-directory-uponelevel/>
  - <https://www.cyberciti.biz/faq/how-do-i-compress-a-whole-linux-or-unix-directory/>
  - <https://stackoverflow.com/questions/18402395/how-to-uncompress-a-tar-gz-in-another-directory>

- Find
  - <https://stackoverflow.com/questions/22388480/how-to-pipe-the-results-of-find-to-mv-in-linux>

- Rename and REGEX
  - <https://www.cyberciti.biz/faq/linux-rename-file/>
  - <https://www.rexegg.com/regex-quickstart.html>
  - <https://serverfault.com/questions/5685/renaming-files-in-linux-with-a-regex>

- Cron
  - <https://crontab.guru/>
  - <https://askubuntu.com/questions/13730/how-can-i-schedule-a-nightly-reboot>
  - <https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log>

- Docker
  - <https://docs.docker.com/engine/reference/commandline/docker/>
  - <https://docs.docker.com/engine/reference/commandline/restart/>

- Bash
  - <https://www.shellhacks.com/tune-command-line-history-bash/>
