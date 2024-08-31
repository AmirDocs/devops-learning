# Linux notes

*Failure is an option here. If things are not failing, you are not innovating enough* 

**index**:

+ LINUX FUNDAMENTALS
  + Command Line Structure
  + Basic Linux Commands
  + File management
  +   


## **LINUX FUNDAMENTALS**

### Command Line Structure:

The general structure of a Linux/UNIX command line looks like this:
**Command** [-flag(s)] [-**Option(s)** [value]] [ **Argument(s)**]


### Basic Linux Commands:
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


### File Management:
Efficent navigation, searching within files, editing texts and even managing configuration files are essential skills you need to be more efficent in daily tasks as a DevOps engineer. In the following examples *.txt* will be used, but this could be anything depending on your file (.git, .py .pptx).

#### Creating files and viewing files:
- Adding contents to exisiting files: You can use `cat *file name*.txt >> *file name*.txt`
- Create a new file by combining mutiple file contents: you can use `cat` followed by `*file name*.txt *file name*.txt > *Newfile*.txt`
- View top of file with `head *filename.txt*`. Follow up with `*-n 5*` for the first 5 lines, use `tail` for bottom lines. For a specific range include `head *-n 10 filename*.txt | tail *-n 5*` and you will get the last 5 lines of the first 10 lines.

#### Moving files:
- An example of moving a file into a directory `mv *file name*.txt *My_Directory*`
- In order to create a nested directory with `mkdir` add `*-p*`. To remove a nested directory utilize `rm *-r*`

#### Using `vim` Mode:
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


### Privileged Accounts:
Managing users and their privileges is a crucial part of system administration. This ensures that only administrative users can peform admin tasks.

#### The `sudo` command:
- The `sudo` command enables elevated privileges required when creating users and groups.
- `sudo su` enables root user.
- Most dangerous command `rm -rf /`
- to view `sudo` log, use `sudo /var/log/auth.log`.

#### Users and Groups:
- You can create a new user and password with `sudo useradd` and `sudo passwd`. To login with them use `su - *newuser*`
- `sudo usermod -aG` grants `sudo` privileges to an existing user. To remove `sudo` privileges, use `sudo deluser *newuser* sudo`
- To view groups, use `cat /etc/group`.
- To create a group use `sudo groupadd *groupname* *newuser*` 

https://chmod-calculator.com/ Chmod Calculator is a free utility to calculate the numeric (octal) or symbolic value for a set of file or folder permissions in Linux servers.


### File Permissions:
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

### Data Redirection:
Redirection is a feature in Linux such that when executing a command, you can change the standard input/output devices.
Understanding data redirection is crucial when handling Standard **Input**, **Output** and **Error Streams**

1. Standard input: `cat < newfile.txt` reads the contents within the file, it is considered as an **input** as you are inputting content into `cat`. `cat newfile.txt` can also be used but it is not considered the same terminology.                     
2. Standard output: The basic terminal screen, an example is `echo "This is a file"` where `This is a file` would be the standard **output**.
3. Standard error: Prints out the description of the error on the main screen. The error description can also be redirected to files, this helps if you want to record your error. 
`~ ls nonexistent` \
`~ ls: cannot access 'nonexistent': No such file or directory` \
`~ ls nonexistent 2> error.txt` \
 ... in this scenerio "*cannot access 'nonexistent': No such file or directory*" will be recorded onto the file error.txt

 If you want to redirect both standard output and standard error (all terminal output) onto the same file use `&>`, instead of the latter.
 An example using a folder called "*mydirectory*" is `ls nonexistent mydirectory &> terminaloutput.txt`

 Lastly `/dev/null` is a virtual null device used to discard any *output* redirected to it. You can use it to unassign `ls nonexistent` from it. It completely discards the output rather than saving or logging it.


### Environment Variables:
The $TERM environment variable, usually defined in the shell profile, is a variable that indicates the terminal type. An enviroment variable is set using the `export` command. 
- Temporary variable: `export NAME=VALUE`, an example of this is `export JAVA_HOME = /usr/bin/java`
- Permanent variables are set by adding the export command to *.zshrc* or *.bashrc* files. When zsh or bash is being used, it will automatically run the variable.
To access the enviroment of a specific variable, such as $HOME use the `echo $*HOME*` command. 

#### Setting a variable:
- Temporary variable: `export MY_VAR= "Hello WOrld"`. This sets `$MY_VAR` as the variable.
- Permanent variable: To assign it to zsh permanently, open `vim .zshrc`. In insert mode enter `export MY_VAR = "Hello WOrld"`. To apply any changes you make on .zshrc or .bashrc, use the `source` command on the main terminal `source .zshrc`

To update an existing variable, such as adding /home/ubuntu to $PATH, enter `export PATH:/home/ubuntu`. This will enable you to create any script you want in */home/ubuntu* and it will recognise that as a programme.

#### Creating a script that uses an enviromental variable:
This script will be called *greet.sh*. It will present a greeting message on the main terminal screen.
1) `vim greet.sh`. In insert mode, enter your script `echo "Hello, $USER! Welcome to $HOSTNAME."`
2) Give it executable permission `chmod +x greet.sh`
3) Now your able to run the script with `./`. Enter `./greet.sh` and it will output `Hello, ubuntu! Welcome to ip-172-33-251-13` on the terminal screen.

**Aliases**: 
Aliases are shortcuts that allow you to create custom commands. To view your current/default aliases, enter `alias`.
- Temporary Alias: To create a temporary alias where `hello` prints `Hello world`, enter `alias hello='echo "hello world"'`
- Permanent Alias: To create a permanent alias, enter the same command above into your $SHELL file. So `vim .zshrc` on the command screen, enter insert mode and paste `alias hello='echo "hello world"'` and `source .zshrc`.


### Linux CLI shortcuts:
Entering `history` on command, will show you your a list of previously executed commands, each command is numbered to allow you to easily re-execute them with `!` (`!244` runs command 244). Another shortcut is*Ctrl r* on you're keyboard. Continuously pressing *Ctrl r* will reverse search commands. *Ctrl j* will insert the command wihout executing.



## SCRIPTING WITH BASH
**Bash** is a command-line tool that interacts with your computer. A **bash script** is a file containing a series of commands you want the computer to execute automatically.
Bash enables you to automate tasks, manage systems and boost efficency.

1) FIrst line of every file starts with a Shebang line: `#!/bin/bash` in `vim examplescript.sh` tells the computer to use bash to run the script. Then enter your script. 
2) Run your script: Make it executable by entering `chmod +x examplescript.sh` on the main terminal and run it with `./examplescript.sh`, as shown in the **Enviromental variables** section. 

### Writing a basic script:

#### Shebang `#!` and Comments:
**Shebang** The shebang provides flexibility by allowing you to specifiy different intepreters or different types of scripts. In `vim` *insert mode*, you can use `#!/usr/bin/python3` for a python script. For ruby scripts, you can use `#!/usr/bin/ruby` instead. Then give executable permissions. 

- **Single line comment `#`:** Use `#` to start a comment in insert mode. 
- **Multiline comment`:'comment'`:** start the line with `: 'anything between this will be regarded as a comment'`

Tip: Place scripts in `$PATH` enviroment variable to run them from anywhere.

#### Variables:
Above we covered **creating a script that uses an enviromental variable**. These are the steps to create a variable which responds with a script, when the file is accessed: 
1) Start with naming and accessing the file `Namefile.sh`.
2) Begin the first line with a shebang like `#!/bin/bash`
3) To assign a variable to print Hello world, when `Namefile.sh` is entered, enter `greeting="Hello World"` and assign `echo $greeting`. Save the file and grant executable permissions. Now `./Namefile.sh` will print `Hello World`.
