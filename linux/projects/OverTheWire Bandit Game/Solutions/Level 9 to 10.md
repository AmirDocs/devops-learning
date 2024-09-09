# Level 9 to 10
The password for the next level is stored in the file **data.txt** in one of the few human-readable strings, preceded by several ‘=’ characters.

**Enter:** `ssh bandit9@bandit.labs.overthewire.org -p 2220`

# Solution

### Commands used:

- `ls`
- `strings data.txt | grep ==


### Password for next level:
```
FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```