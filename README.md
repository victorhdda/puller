# Puller - a git pull script to update local blog server


### What is needed:

- Pull a git project from a static url periodically and update a blog content;
- Rename and move specific files to a new local folder;
- Add specific permissions to files (`-rwxr--r--`) and folders (`drwxr-xr-x`);
- Attach the execution of this script to a cron job.

### Solutions:
- Created a script to process temporary and destination folders; clone remote public github repository; copy and rename contents do desired paths and change permissions.
- Created a cron job that executes this scripts periodically.


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

rename -n 's/(\d{4})-(\d{2})-(\d{2})-//g' *

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
