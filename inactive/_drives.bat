@echo off
rem net use P: /delete
rem net use P: \\ice-lac\Storage\Projects /persistent:yes
rem net use L: /delete
rem net use L: \\ice-lac\Storage\Projects\external\Local_Market /persistent:yes
rem net use R: /delete
rem net use R: \\backup2\Storage\repository /persistent:yes
net use T: /delete
net use T: \\10.10.2.36\apache\assets /persistent:yes
