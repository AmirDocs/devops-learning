# Level 6 to 7
The password for the next level is stored in a file somewhere under the **inhere** directory and has all of the following properties:

- human-readable
- 1033 bytes in size
- not executable

**Enter:** `ssh bandit5@bandit.labs.overthewire.org -p 2220`

# Solution

### Commands used:

- `ls`
- `ls -al`
- `du -b -a | grep 1033`
- `cat ./maybehere07/.file2`


### Password for next level:
```
HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
```