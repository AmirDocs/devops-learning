# **SCRIPTING WITH BASH**

**Bash** is a command-line tool that interacts with your computer. A **bash script** is a file containing a series of commands you want the computer to execute automatically.
Bash enables you to automate tasks, manage systems and boost efficency.

1) FIrst line of every file starts with a Shebang line: `#!/bin/bash` this tells the computer to use bash to run the script. Then enter your script. 
2) Run your script: If you made changes in `vim` mode, make your script executable by entering `chmod +x examplescript.sh` on the main terminal and run it with `./examplescript.sh`, as shown in the **Enviromental variables** section. 

## **Writing a basic script**:

### **Shebang `#!` and Comments**:
**Shebang** The shebang provides flexibility by allowing you to specifiy different intepreters or different types of scripts. In `vim` *insert mode*, you can use `#!/usr/bin/python3` for a python script. For ruby scripts, you can use `#!/usr/bin/ruby` instead. Then give executable permissions. 

- **Single line comment `#`:** Use `#` to start a comment in insert mode. 
- **Multiline comment`:'comment'`:** start the line with `: 'anything between this will be regarded as a comment'`

Tip: Place scripts in `$PATH` enviroment variable to run them from anywhere.

### **Variables**:
Above we covered **creating a script that uses an enviromental variable**. These are the steps to create a variable which responds with a script, when the file is accessed: 
1) Start with naming and accessing the file `Namefile.sh`.
2) Begin the first line with a shebang like `#!/bin/bash`
3) To assign a variable to print Hello world, when `Namefile.sh` is entered, enter `greeting="Hello World"` and assign `echo $greeting`. Save the file and grant executable permissions. Now `./Namefile.sh` will print `Hello World`. To assign a variable to a number for instance 42, instead enter `count=42` with `echo$ count` in `vim`.
You can assign anything with a variable such as a name, using `name="Amir"` and `echo "Hello $name`

### **Parameters**:
Parameters allow you to customize the behaviour of your script and make it more flexible. Parameters are passed on the main command line. When executing a script with parameters, the values passed on the command line will be subsituted into the scripts of $1 and $2.
In `vim` insert mode, list `echo "parameter1: $1` and `echo "parameter2: $2`. *Parameter1* is changeable and can be named something else as this is an example. 
On the main command terminal, to pass the two parameters above enter `./Namefile.sh *hello hey*`. To run all parameters in one output, enter `vim` and insert `echo "All Parameters: $@"`

## **Arithmetic Expansion** `$(())`:
Arithmetic expansion allows the evaluation of an arithmetic expression and the substitution of the result. This allows you to perform a variety of mathematical operations, such as addition, subtraction, multiplication, and division.

Example: `$((10*3))`

On Visual Studio Code, you can also assign changeable values to the expression. An exmaple is:
``` 
#!/bin/bash 

num1=5
num2=10

result=$((num1 + num2))

echo "The sum of $num1 and $num2 is: $result"
```
```
The sum of 5 and 10 is: 15
```

Below is another example of another Arithmetic Exapansion, this time with **parameters**.
```
#!/bin/bash

length="$1"
width="$2"

area=$((length * width))
perimeter=$((2 * (length + width)))

echo "Rectangle area: $area"
echo "Rectangle perimeter: $perimeter"
```
then open terminal and enter `chmod +x filename.sh` and run the script followed by the two position parameters 
```
./filename.sh
8 5
```
```
Rectangle area: 40
Rectangle perimeter: 26
``` 


