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







