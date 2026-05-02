---
author: Seth
date: MMM dd, YYYY - VIVITA
paging: Slide %d / %d
theme: ../theme/theme.json
---


```
~~~toilet --font mono9 -t
INTRO
~~~
```

```
~~~toilet --font mono9 -t
AUTOMATION
~~~
```
---

## Getting repo updates...

If you have made changes to your code:  
1. go to the project repository root `~/linux-starters`
1. Git stash your changes:  
```
git add .
git stash
```
1. Get latest code changes:  
```
git pull origin main`
```
1. Move your changes back:  
```
git stash pop
```

And you're ready for the class!

---


## Dependencies ...

- [ ] Install `vim`

## Learning objectives
- [ ] Refresher: `find` Cinderella's shoes
    - Things we missed last week: `rm`, `mkdir`, `mv`, `chmod`
- [ ] `shell scripting`
- [ ] `cron`
- [ ] `FS` - file systems, `systemd`

## Stretch goals

- [ ] Play with openclaw
- [ ] `SSH`

## Discussion
- Homework / What are we going to do next week

---

## More commands: `find`

### `find` Cinderella's shoes


```bash
find . -name "*prince*"
```

```bash
find . -name "*prince"
```

```bash
find . -name "prince*"
```

> Q: What is *?

---

## Introducing wildcards (*)

```bash
ls *
```

```bash
ls *.md
```

__Note: You will use this a lot__

---

## `find` Cinderella's shoes - Activity time!

```
find . -name "*prince*"
```

> Q: where are Cinderella's shoes?
> Q: Can you find all the hidden items at once in the shire (W2) ?

---

## More commands: `cp` ,`mv`, `rm`

### `cp` - copy files
```
cp castle/prince_charming .
```

### `mv` - rename and move files
```
mv prince_charming prince_annoying
```

### `mv` - rename and move files
```
mv prince_charming prince_annoying
```

---

## Shell-scripting

### Create your first bash script

1 .Create your empty file  

```
touch hello_world.sh
```

1. start with a shebang at the start of the file (#!):   

`#!/bin/bash`

1. Type a command after the shebang, e.g.:  

```
echo "hello world"
```

1. Make the file executable:  

```
chmod +x hello_world.sh
```

1. Execute the file:  

```bash
./hello_world.sh
```

Note: all file paths are relative to where you run the file!

---

## Cron: scheduled bash scripts
a time-based job scheduler that automatically runs scripts or commands at specific intervals, such as daily backups, system maintenance, or scheduled alerts.


How do you run a bash script when you want it, e.g. 
1. Feed your fish every day at 7am and 7pm
1. Every school/work day to wake you up at 7am

### An example - reminder for Cinderella to go home before midnight

Create a bash script to tell you the reminder:

```bash
touch reminder.sh
echo "#!/bin/bash" > reminder.sh
echo 'espeak -s 40 "please go home before midnight!"' >> reminder.sh
chmod +x reminder.sh
./reminder.sh
```

Select default edit for `cron` (first-time only):
```
select-editor
```

and choose `vim` (basic). Choose `nano` if are familiar with it.

Open crontab:  
```
crontab -e
```

If this is your first-time opening cron, select `vim` (option 2)

---

## How to use cron?
To define the time you can provide concrete values for
- minute (m)
- hour (h)
- day of month (dom)
- month (mon),
- day of week (dow)
or use '*' in these fields (for 'any').

| m | h | dom | mon | dow | command |
|---|---|-----|-----|-----|----------------------------------|
| * | * | *   | *   | *   | `/path/to/your/file.sh` |

### Every 10 mins

| m | h | dom | mon | dow | command |
|---|---|-----|-----|-----|----------------------------------|
| */10 | * | *   | *   | *   | `/path/to/your/file.sh` |

### Every day at 3PM

| m | h | dom | mon | dow | command |
|---|---|-----|-----|-----|----------------------------------|
| 0 |15 | *   | *   | *   | `/path/to/your/file.sh` |


### Every Mon at 3PM

| m | h | dom | mon | dow | command |
|---|---|-----|-----|-----|----------------------------------|
| 0 |15 | *   | *   | 1   | `/path/to/your/file.sh` |

---

### Every Cathy's birthday

| m | h | dom | mon | dow | command |
|---|---|-----|-----|-----|-------------------------------------------------------|
| 0 | 0 | 25   | 4  | *   | `base64 -d ~/linux-starters/W2/.secret.b64 \| lolcat` |

--- 
Note: I know its senggit


### Ask Cinderella to go home
30 23 * * * ~/linux-starters/W3/reminder.sh


---

## Activity: 

1. Turn the pumpkin into a carriage for Cinderella at 6pm (every evening)
use `~/linux-starters/W3/bibbidi-bobbidi-boo.sh`
<br/>
1. Turn the carriage back into a pumpkin at 12-midnight (every night)
use `~/linux-starters/W3/midnight.sh`

```

```

### Cheatsheet

- `crontab -e`  
in `vim`:  
- `i`     - to edit/insert
- `ESC`   - to escape out of edit mode
- `:wq`   - to save changes
- `:q!`   - quit without saving
---

Your cron should look like this
```
0 18 * * * ~/linux-starters/W3/bibbidi-bobbidi-boo.sh
0  0 * * * ~/linux-starters/W3/midnight.sh
```
---

### Test your crontab scheduler
Are you ready?

#### Turn off NTP Time Sync
```bash
sudo timedatectl set-ntp false
sleep 1
timedatectl
```
#### Open a new terminal and run:  
```
watch -n .4 'cat carriage' | lolcat
```

#### To force time to 1759hrs:  
```
sudo date -s "2026-05-02 17:59:59"
```

#### To force time to 2359hrs:  
```
sudo date -s "2026-05-02 23:59:59"
```

---

## Restore NTP

```bash
sudo timedatectl set-ntp true
sleep 1
timedatectl
```
Note: Check to make sure that NTP service is **active**

---

## FS (A tour on where everything lives in Linux)

### Linux File Structure

Linux is CaSe-SenSiTive.

###   The Filesystem Hierarchy 

- Linux have no drive letters.
<br/>
- It starts from root directory **/**.
<br/>
- Removable Drives are mounted under /media, e.g. cdrom
<br/>
- **/home** – contains all user home directories
<br/>e.g. /home/<USERNAME> contains files of a specific user

---
### Important directories
*(Do not mess with these directories!)

- **/bin** : Command binaries files (OS)
<br/>
- **/usr/bin**: Command binaries that are not essential enough to place into /bin 
<br/>
- **/boot**: Static files of the boot loader. Stores data that is used before the kernel begins executing user-mode programs. 
<br/>
- **/sbin**: System binaries. Programs necessary for the boot loader 
<br/>
- **/lib**: kernel modules and those shared library images
<br/>
- **/opt, /var/opt**: reserved for all the software and add-on packages that are not part of the default installation. Stuff you install yourself.
<br/>
- **/proc**: Not really a directory. Very special virtual filesystem. 
<br/>Sometimes referred to as a process information pseudo-file system.
<br/>(READ ONLY. Do not mess with this directory!)
<br/>Every number is actually a process id. (see ps)

---
### Devices aka peripherals
- **/dev** : directory is the location of special or device files.
<br/>Tip: Everything in Linux is a file or a directory!
<br/>
- /dev/hd_ - hard disk
<br/>
- /dev/hd*a* – Primary hard disk
<br/>
- /dev/hd*a1* – Primary hard disk, Partition 1
<br/>
- /dev/cdrom – CD/DVD drive
<br/>
- ~~/dev/fd - floppy drive~~
<br/>
- /dev/dsp – audio device (speaker)
<br/>
- /dev/lp – printer, parallel port
<br/>
- /dev/tty – terminals or console

---
### System Configuration files
- **/etc** - contains all system related configuration files
<br/>
- /etc/fstab – [FileSystem TABle] filesystems mounted automatically at startup
<br/>
- /etc/group - lists user groups and who belongs to them.
<br/>
- /etc/hostname – machine hostname
<br/>
- /etc/passwd - contains the user database, with fields giving the username, real name, home directory, and other information about each user. Does not  actually contain password.
<br/>
- /etc/syslog.conf - Lists where log files should go, what messages are written to them and the level of verbosity.
<br/>
- /etc/timezone - local timezone.
<br/>
- /etc/rc - directories contain all the files necessary to control system services and configure runlevels.

---
### Ref: Bash shell script cheat sheet
* https://linuxize.com/cheatsheet/bash/
* https://github.com/RehanSaeed/Bash-Cheat-Sheet


---

## Discussion: Next week

> Explore and find a software/trick that runs on Linux and share it with the class

The org team can help you set it up 

1. PlatformIO (IOT) - Seth
1. Fish-o-matic - Cathy
1. Webcam - Neo
1. Alexander
1. Evander
1. Trevis
1. Viya
1. George
1. Zephan
1. Kim
1. Francis
1. Hasan
1. Hidayah
1. Hisham

Did I miss anyone?

## Suggestions
1. Some 3D modeling tools
1. Related to the makerspace?
1. Command-line wizardry


---
