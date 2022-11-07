Shell

Terminal to gif recorder
https://github.com/chjj/ttystudio

Set passwordless login for scripts
http://www.cyberciti.biz/faq/ssh-passwordless-login-with-keychain-for-scripts/

http://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex

history
export HISTSIZE=0 disable history
export HISTTIMEFORMAT='%F %T ' display timestamp for hist commands
history | tail -3
history | more
!-12    	execute the command 12 commands ago.
!512 execute command number 512 from the history
!ps      	previous command that starts with “ps”
ls –l !cp:2          	shows directory –l, but takes the second argument from a past cp command.
STRG+R   then search term             	searches the recent commands for a term
with Enter – execute with left/right edit before executing

Glipper -- I always need a history-list of cut-&-pastes.
whereis ls       	location of ls command
whatis ls         	single line description on a command.
whoami           currently logged in user
hostname
date
date ; ls ; whoami	executes 3 commands in a row.
mc   		midnight commander.
printenv 	prints all environment variables

Shells
sh - bourne shell (too old), written by Steve BournDoes not allow for interactive scripting at all. 
bash - the standard Bourne Again SHell, an enhanced version of the original Unix bourne shell pbash shell scripting  http://linux.die.net/abs-guide/
zsh   z shell. a superset of bash shell, with better auto-completion   https://github.com/robbyrussell/oh-my-zsh
Bash is a nice default but we’re not here for defaults, we’re here for the best we can get and that means Zsh and all the bells and whistles that come along with it. In a nutshell, Zsh gives us a much more user friendly experience on the command line, it gives us things like better auto-completion, Vim key bindings and smart guesses when you write a command wrong. Zsh has a huge user community behind it and those smart people have added many, many customisations. 
fish
http://www.tecmint.com/fish-a-smart-and-user-friendly-interactive-shell-for-linux/ auto-complete
polyshell execute commands on multiple machines at the same time http://guichaz.free.fr/polysh/
csh (c shell) and tcsh are not good at all. 
http://www.faqs.org/faqs/unix-faq/shell/shell-differences/


BASH SHELL
env                     	prints all  environment variables
echo $USER prints environment variable user
$SHELL   shows the shell
echo $0 shows the shell also.
chsh –list-shells
bash –version                  	// should be v4;

export CDPATH=/usr/local/forteco       dann kann imn mit cd “APP”, cd “fx-backoffice-mono” aus jedem anderen verzeichnis wechslen.  MUJLTIPLE DIRECTOORIES SEPARATED WITH “:”
~/.bash_profile                	wird bei user login gestartet.
                                           	export CDPath dort reingeben.
                                           	auto-start apps ingui reingeben..
Alias ..2=”cd ../..”             	ALIAS für schnellen verzeichnis wechsel.
alias ..3=”cd ../../..”

cat file.txt > /Dev/null don’T show std.out when printing this file -> useful to find error messages only.


xargs: takes output of a command and passes it as an argument to another command   
# find / -name *.jpg -type f -print | xargs tar -cvzf images.tar.gz  /find all jpg images and create archive.
 
in .bash_profile:
        	function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

pfade setzen in .profite und .bashrc
INFODIR=/usr/local/info:/usr/share/info:/usr/info
INFOPATH=$INFODIR
export INFODIR INFOPATH
/etc/rc.d   -> get executed on startup.
            	Ntpdate ntp1.ptb.de                       	// synchronisiert die systemzeit…
$ export ORACLE_HOME=/u01/app/orcl  export an environment variable
$ export | grep ORACLE   To view oracle related environment variables.
Bash lop
            	#!/bin/bash 
            	for i in $(seq 1 10) 
            	  do
            	   echo -n This is iteration $i
            	   if [ $i  -eq  5 ]
            	   	then  break
              	fi
            	done
 Every time you log-in, the .bashrc script in your home directory is executed. 
 
DEBIAN CONSOLE COLORS:
for       	~/.bash_profile                  .bashrc ???
Add:                   	eval `dircolors -b`
                           	alias ls='ls --color=auto'
                           	alias dir='ls --color=auto --format=vertical'


shell feature called a here document, try this:
sqlite3 /Users/user/Documents/Test/dbName.dba <<EOS insert into myTable (Date, Details, Category, Average) values(datetime('now','localtime'), '$1', '$2', '$3'); select "Category1 total = " sum(Average) from ( select * from myTable where Category = 'category1' ); select "Category2 total = " sum(Average) from ( select * from myTable where Category = 'category2' ); EOS

http://bash.cyberciti.biz/guide/Main_Page
Autostart
cd /etc/rc.d/init.d/ 

xargs - Befehlszeilen splitter
https://de.m.wikipedia.org/wiki/Xargs

tee - duplicates input/output streams (named after a T splitter in Pipes)
https://en.wikipedia.org/wiki/Tee_(command)


shell scripts
http://linuxcommand.org/lc3_wss0080.php   WRITING SHELL SCRIPTS (loops, ..)
http://users.telenet.be/mydotcom/howto/linux/automatic.htm automatic scripts to install packages
http://bash.cyberciti.biz/guide/Main_Page
http://tldp.org/LDP/abs/html/  advanced bash scripting guide.
http://www.tldp.org/HOWTO/pdf/Bash-Prog-Intro-HOWTO.pdf

cat /etc/shells 		shows the installed shells ( is a normal textfile)
cat /etc/passwd  	shows the default shell for each user.

interactive shells 
/etc/profile
~/.bash_profile
~/.bash_login
~/.profile
~/.bash_logout
non interactive shells (per ssh)

~/.bashrc

/etc/rc.d/init.d    or  /etc/init.d      system startup scripts

#!/bin/bash

command1 && command2
and
command1 || command2
With the && operator, command1 is executed and command2 is executed if, and only if, command1 is successful. With the || operator, command1 is executed and command2 is executed if, and only if,
command1 is unsuccessful


http://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex
kill $(ps aux | grep '[p]ython csp_build.py' | awk '{print $2}')
Details on its workings are as follows:
The ps gives you the list of all the processes.
The grep filters that based on your search string, [p] is a trick to stop you picking up the actual grep process itself.
The awk just gives you the second field of each line, which is the PID.
The $(x) construct means to execute x then take its output and put it on the command line. The output of that ps pipeline inside that construct above is the list of process IDs so you end up with a command like kill 1234 1122 7654.

dialog utility - how to construct nice CommandLine Dialogs in Bash Scripts
http://www.unixcl.com/2009/12/linux-dialog-utility-short-tutorial.html?m=1


