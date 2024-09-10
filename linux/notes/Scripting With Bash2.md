# **SCRIPTING WITH BASH 2**

***index***:

  - Command Line Structure


## Loops

### `While` Loops
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

### `For` Loops
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
