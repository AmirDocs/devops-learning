# **SCRIPTING WITH BASH 3**

## **Error handling**

### **Introduction to Error Handling**
Foreseeing where things could go wrong and taking appropriate measures to handle those situations, rather then letting the scripts crash or continue in a error state. 
In this example, an `if` statement is introduced to stop a script a script from crashing. This will output the error comment:
```
#!/bin/bash

num1=10
num2=0

if [ $num2 -eq 0 ]; then
    echo "Error: Division by zero is not allowed"
    exit 1
fi 

result=$((num1 / num2))

echo "The result is: $result"
```

### **`if` statements recap for Error Handling**
`if` statements form the backbone of error handling

An example script that checks if a file exists within a directory:
```
#!/bin/bash

FILE="/nonexistent

if [[ -f "$FILE" ]]; then
   echo "File exists."
else
   echo "File does not exist."
fi
```

### **Exit Codes**
Whenever a command or script ends, it returns a numerical exit code to the system, to represent whether the command or script completed successfully or not. Enter `echo $` in the terminal after receiving your output.
+ `0` indicates success.
+ `1` indicates an error.
The example script below checks if git is installed on our system, and provides an appropiate exit code, displaying whether it is installed or not:
```
#!/bin/bash 

command -v git 2>dev/null

if [[ $? -ne 0 ]]; then
    echo "git is not installed. Please install git."
    exit 1
else
    echo "git is installed"
fi
```

## **Piping**
Piping within functions: Piping allows us to pass the output of a command as input into another. `|`

1. `File_count=$(ls "$directory" | wc -l )`: Piping is used to find out the word count for this directory: 
2. `grep "$search_term" log.txt | awk ' { print $2 }`: Piping is used to extract the second column with `awk`, and search for a term inside a existing log. You will need to follow up with `search_logs "EnterTermHere"`

*These examples would be included in a wider script*

## **Set Commands**
Set commands make our script more robost and easy to debug.

**Main commands** 

- `set -e` or `set -o errexit`
at the beginning of the script will print the script but stop executing at the point the error occurs.

- `set -u` or `set -o nounset`
at the beginning of the script forces the script to stop when it encounters an uninitialized variable, ( a variable that has not been defined ) Example *W: unbound variable*:  
```
#!/bin/bash

set -u

X=10 
y=20 
Z=$((X + Y + W))
echo "Z equals: $Z"
```

- `set -x` prints every command that will be executed to the terminal before it is actually executed. This helps to understand what the script is doing at each step. Useful for troubleshooting scripts. Once your finished debugging you can disable the option in your script using `set +x`


- `set -eux` will print every set command and will either stop if there is a point of error or an uninitialized variable and print every command that will be executed to the terminal, before it is actually executed.

**Other Commands**

- `set -o pipefail` This causes the pipeline to return the exit status of the last command in the pipeline that exited with a non 0 status. This can be very useful when your piping commands together.

## **Environment Variables**:
The $TERM environment variable, usually defined in the shell profile, is a variable that indicates the terminal type. An enviroment variable is set using the `export` command. 

| Standard enviroment Variable | Description |
| --- | --- |
| $LOGNAME | Login name of current user |
| $SHELL | Current user shell |
| $PWD | Print current directory |
| $PATH | Executable search paths |
| $LANG | Default language |

- Temporary variable: `export NAME=VALUE`, an example of this is `export JAVA_HOME = /usr/bin/java`
- Permanent variables are set by adding the export command to *.zshrc* or *.bashrc* files. When zsh or bash is being used, it will automatically run the variable.
To access the enviroment of a specific variable, such as $HOME use the `echo $*HOME*` command. 

### **Setting a variable**:
- Temporary variable: `export MY_VAR= "Hello WOrld"`. This sets `$MY_VAR` as the variable.
- Permanent variable: To assign it to zsh permanently, open `vim .zshrc`. In insert mode enter `export MY_VAR = "Hello WOrld"`. To apply any changes you make on .zshrc or .bashrc, use the `source` command on the main terminal `source .zshrc`

To update an existing variable, such as adding /home/ubuntu to $PATH, enter `export PATH:/home/ubuntu`. This will enable you to create any script you want in */home/ubuntu* and it will recognise that as a programme.

### **Creating a script that uses an enviromental variable**:
This script will be called *greet.sh*. It will present a greeting message on the main terminal screen.
1) `vim greet.sh`. In insert mode, enter your script `echo "Hello, $USER! Welcome to $HOSTNAME."`
2) Give it executable permission `chmod +x greet.sh`
3) Now your able to run the script with `./`. Enter `./greet.sh` and it will output `Hello, ubuntu! Welcome to ip-172-33-251-13` on the terminal screen.

You can also label enviroment variables to local variables, and then read them out using the echo command:
```
#!/bin/bash

showmewherethehomedirectoryisnow="$HOME"
whosthecurrentuser="USER"
tellmetheostypewhileyouratit="$OSTYPE"

echo "Home Directory: $showmewherethehomedirectoryisnow
echo "The Current User: $whosthecurrentuser
echo "OS Type: $tellmetheostypewhileyouratit
```

### **Reading Files**:
```
#!/bin/bash

process_file() {
    local file_path="$!"

    cat "$file_path" | while IFS= read -r line; do
        echo "Processing line: $line"
    done
}

process_file ".log.txt"
```

## **Aliases**: 
Aliases are shortcuts that allow you to create custom commands. To view your current/default aliases, enter `alias`.
- Temporary Alias: To create a temporary alias where `hello` prints `Hello world`, enter `alias hello='echo "hello world"'`
- Permanent Alias: To create a permanent alias, enter the same command above into your $SHELL file. So `vim .zshrc` on the command screen, enter insert mode and paste `alias hello='echo "hello world"'` and `source .zshrc`.

+ Change PATH Permanently: Create a PATH name and file name: `vi my_scripts/greet.sh` Once you enter vi mode enter your:
```
#!/bin/bash

echo "Hello World"
```
Save with `:wq!` and Chmod the path and file `vi my_scripts/greet.sh`.
To make this change permanent enter `echo "export PATH=$PATH:~/my_scripts" >> ~/.zshrc` and then `source ~/.zshrc`


