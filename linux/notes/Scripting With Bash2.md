# **SCRIPTING WITH BASH 2**

***index***:

  - Command Line Structure


## Loops

### While Loops
While loops allow you to repeatedly execute a block of code an unknown number of times, as long as a certain condition remains true. They provide a powerful too to automate tasks and enable you to repeat a block of code and only exits the loop when a specific condition becomes false.

While loop structure:
```
#!/bin/bash

While condition
do 
      # Code to be executed
done
```

An example of a while loop, which creates an array called fruits, with three elements, apple, banana and orange. Then it starts a wild loop that illiterates over the element. Within each illiteration it prints the current fruit and increments the index variable by 1 (initialised by 0), so each time in increments to 1. The loop continues until all the elements in the array have been processed, exiting at 3:
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

### For Loops

