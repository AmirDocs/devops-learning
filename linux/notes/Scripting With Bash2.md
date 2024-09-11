# **SCRIPTING WITH BASH 2**

***index***:

  - Command Line Structure


## **Loops**

### **`While` Loops**
While loops allow you to repeatedly execute a block of code an unknown number of times, as long as a certain condition remains true. They provide a powerful too to automate tasks and enable you to repeat a block of code and only exits the loop when a specific condition becomes false.

While loop structure:
```
#!/bin/bash

While condition
do 
      # Code to be executed
done
```

An example of a while loop, which creates an array called fruits, with three elements, apple, banana and orange. Then it starts a wild loop that iterates over the element. Within each iteration it prints the current fruit and increments the index variable by 1 (initialised by 0), so each time in increments to 1. The loop continues until all the elements in the array have been processed, exiting at 3:
```
#!/bin/bash 

fruits=("apple" "banana" "orange")
index=0

while [ $index -lt ${#fruits[@]} ]
do
    echo "Fruit: ${fruits[$index]}"
    ((index++))
done
```
The output for this script:
```
Fruit: apple
Fruit: Banana
Fruit: Orange
```

### **`For` Loops**
For loops allow you to iterate over a sequence of values and perform repetitive tasks. They enable you to repeat a block of code for a specified number of iterations or over a sequence of values.

`for` loop structure:
```
#!/bin/bash 

for variable in sequence
do 
    # Code block to be executed
done 
```

An example of a for loop where the variable `i` is assigned to 1, and the sequence will be 1,2,3,4,5 (`i<=5`). For each element in the sequence, we want to increment the value to 1 (`i++`), another way to do this is the sequence method:
```
#!/bin/bash 

for (( i=1; i<=5; i++ ))                                      for number in $seq (1 5)
do 
    echo "Number: $i"                                         echo "number: $number"
done 
```
giving you:
```
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

An example with fruits:
```
#!/bin/bash 

for (( i=1; i<=5; i++ ))

fruits=("apple" "banana" "ornage")

for fruit in "${fruits[@]}"
do
    echo "fruits: $fruit"
done
```

### **Break and Continue**

- `break` allows you to interrupt a loop.
The example below, when applied to the first `for` loop above, will exit the loop and stop at 2:
```
if [ $i -eq 3 ]
then 
    break
fi
```

- `Continue` will enable you to skip the value, but will continue to output the sequence:
The example below, when applied to the first `for` loop above, will skip the number 3 and `continue` the sequence with 4 and 5:
```
if [ $i -eq 3 ]
then 
    break
fi
```


## **Functions** 
Functions allow you to turn your code into modules, improve script organisation and enhance code readability. They can be described as mini programmes within your bash script, encapsulating a set of instructions that can be called and executed whenever required.

### **Structure Of Functions**

```
#!/bin/bash


function_name() {
    # code block to be executed
}
```

Example of a greeting function, where it takes "Amir" as the parameter within the function, assigns it to a local variable name, and then uses that within the echo command:
```
#!/bin/bash


Hello_World() {
    echo "Hello World!"
}

greet_person() {
    local name="$1"
    echo "Hello, name!"
}

greet_person "Amir"
```

### **Parameters**
Parameters allow us to pass data to functions, making them more versatile and adaptable. Function parameters provide a way to pass data to functions, enabling them to peform specific tasks based on provided input. Special parameters provide additional ways to handle input data. These include $* , $@ , and $#. 
```
#!/bin/bash


print_args() {
    echo "Number of arguments: $#"
    echo "Script name: $0
    echo "First argument: $12
    echo "Second argument: $2"
    echo "All arguments: $0"

}

print_args "Alice" "Bob" "Ahmed"
```
- Positional parameters: Allow us to pass data to functions and access them using numbered variables, such as `$1`, `$2`.

- Special parameters provide additional information about the script and the arguments passed to it, such as `$#` for the number of arguments, `$0` for the name of the script, and `$@` for all arguments. Special parameters provide additional ways to handle input data. These include `$*` , `$@` , and `$#`. 

## User Input
User input allows your script to interact with users and make them more dynamic and responsive. User input allows our script to interact with users and make them more dynamic and responsive. By accepting User Input within functions, we can create powerful interactive scripts. 







