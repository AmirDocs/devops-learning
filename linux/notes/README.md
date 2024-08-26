# Linux notes

*Failure is an option here. If things are not failing, you are not innovating enough* 

**index**:

+ LINUX FUNDAMENTALS
  + Command Line Structure
  + Basic Linux Commands
  + File management
  +   


## **LINUX FUNDAMENTALS**

### Command Line Structure 

The general structure of a Linux/UNIX command line looks like this:
**Command** [-flag(s)] [-**Option(s)** [value]] [ **Argument(s)**]


### **Basic Linux Commands**

| Command | Description |
| --- | --- |
| `pwd` | Print working directory  |
| `ls` | List files |
| `cd` | Change Directory |
| `cat` |Concatenate and display file contents |
| `cp` | Copy files  |
| `mkdir` | Make directories |
| `mv` | Move or rename |
| `rmdir` | Remove empty directories |
| `touch` | Create empty file |
| `cat` |Concatenate and display file contents |
| `rm` | Delete file |
| `echo` | Add "text" within document (followed by '> filename') |
| `grep` | Global regular expression print (searching and matching text patterns in files) |
| `man` | Manual Page |

Fun fact: Ctrl D ends an input 🤕


### **File Management**
Efficent navigation, searching within files, editing texts and even managing configuration files are essential skills you need to be more efficent in daily tasks as a DevOps engineer. In the following examples *.txt* will be used, but this could be anything depending on your file (.git, .py .pptx).

#### Creating files and viewing files ####
- Adding contents to exisiting files: You can use `cat *file name*.txt >> *file name*.txt`
- Create a new file by combining mutiple file contents: you can use `cat` followed by `*file name*.txt *file name*.txt > *Newfile*.txt`
- View top of file with `head *filename.txt*`. Follow up with `*-n 5*` for the first 5 lines, use `tail` for bottom lines. For a specific range include `head *-n 10 filename*.txt | tail *-n 5*` and you will get the last 5 lines of the first 10 lines.

#### Moving files ####
- An example of moving a file into a directory `mv *file name*.txt *My_Directory*`
- In order to create a nested directory with `mkdir` add `*-p*`. To remove a nested directory utilize `rm *-r*`

#### Using `vim` Mode ####
- `vim` has several modes, the three most important ones are listed below: 
 - The command mode (default), allows you to move around the file and peform various operations like deleting texts or copying lines.
 - The insert mode, where you can insert and edit text.
 - Visual mode, used to select text in a visual format.

| Commands in `Vim` mode | Description |
| --- | --- |
| `wql` | Save and leave |
| `ql` | leave |
| `:` | Jump to specific line |
| `/` | search |
| d | Delete |
| y and p | Copy (yank) and paste |
| u and Ctrl r | undo change and redo undone change |
| `:set number` and `:set nonumber` | Show or hide numbering |


### Privileged Accounts
Managing users and their privileges is a crucial part of system administration. This ensures that only administrative users can peform admin tasks.

#### The `sudo` command ####
- The `sudo` command enables elevated privileges required when creating users and groups.
- `sudo su` enables root user.
- Most dangerous command `rm -rf /`
- to view `sudo` log, use `sudo /var/log/auth.log`.

#### Users and Groups ####
- You can create a new user and password with `sudo useradd` and `sudo passwd`. To login with them use `su - *newuser*`
- `sudo usermod -aG` grants `sudo` privileges to an existing user. To remove `sudo` privileges, use `sudo deluser *newuser* sudo`
- To view groups, use `cat /etc/group`.
- To create a group use `sudo groupadd *groupname* *newuser*` 

https://chmod-calculator.com/ Chmod Calculator is a free utility to calculate the numeric (octal) or symbolic value for a set of file or folder permissions in Linux servers.

#### File Permissions
 A **Script** is an executable file, that can be ran as a programme using `vim` mode. Mastering the techniques below is very important to manage files effectively in linux.
**U**ser, **G**roup, **O**ther: rwx, rwx, rwx

| Bit | Purpose | Octal Value |
| --- | --- | --- |
| r | Read | 4|
| w | Write | 2 |
| x | Execute | 1 |
| - | No permission | 0 |

Different ways to give file permission commands:
- `chmod u+x,g+r,o-w examplefile.txt` or `chmod 142`  To give executable permissions to users, read permissions to group and no permission to others.
- `chmod +x examplefile.txt` To give executable permissions for all users.
- `chmod ug=rw,o=r examplefile.txt` To give users and groups read and write permissions, and others readable permissions. *rw-rw-r--*
- `chown` Changes file owner. An example is `sudo chown newuser examplefile.txt` or `sudo chown ubuntu:newuser examplefile.txt`
- `chgrp` changes group ownership. An example is `sudo chgrp admin2 examplefile.txt` or `sudo chown -R newuser:admin2 my_directory_example`
in this example case, both the previous group and user is *ubuntu*, therefore Ubuntu's permissions becomes **Other** when ownership is changed.
