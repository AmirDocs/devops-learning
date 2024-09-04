# Level 6 to 7
The password for the next level is **stored somewhere on the server** and has all of the following properties:

- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

**Enter:** `ssh bandit6@bandit.labs.overthewire.org -p 2220`

# Solution

### Commands used:

- `ls`
- `find / -user bandit7 -group bandit6 -size 33c 2>/dev/null`
- `cat /var/lib/dpkg/info/bandit7.password`


### Password:
```
morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

```