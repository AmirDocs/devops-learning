# Level 11 to 12
The password for the next level is stored in the file **data.txt**, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions.

**Enter:** `ssh bandit11@bandit.labs.overthewire.org -p 2220`

# Solution

### Commands used:

- `ls`
- `ROT13 (rotate 13): cat data.txt | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'`


### Password for next level:
```
7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```

