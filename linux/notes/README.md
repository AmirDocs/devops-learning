# Linux notes

*Failure is an option here. If things are not failing, you are not innovating enough* 

**index**:

+ LINUX FUNDAMENTALS
  + Command Line Structure
  + Basic Linux Commands
  + File management  


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


### **File management**
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


