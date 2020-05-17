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


https://www.rexegg.com/regex-quickstart.html


https://serverfault.com/questions/5685/renaming-files-in-linux-with-a-regex
