# Level 6 to 7
The password for the next level is **stored somewhere on the server** and has all of the following properties:
- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

**Enter:** `ssh bandit5@bandit.labs.overthewire.org -p 2220`

# Solution

### Commands used:

- `ls`
- `ls -al`
- `du -b -a | grep 1033`
- `cat ./maybehere07/.file2`


### Password:
```
HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
```