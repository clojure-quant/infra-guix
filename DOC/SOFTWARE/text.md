TEXT EDIT
touch file.txt    	creates empty file.txt
CAT     	         prints file contents to screen
cat –n file.txt    	display file with line numbers

TAIL
tail –n 30 /var/log/messages
tail –n 30 /var/log/mail
$ tail -f log-file 	View the content of the file in real time using tail -f. This is useful to view the log files, that keeps growing. The command can be terminated using CTRL-C.

HEAD
head –n 10 file 	first 10 lines of file

LESS    displays content of file forwards or backwards; less is very efficient while viewing huge log files, as it doesn’t need to load the full file while opening.
$ less huge-log-file.log
CTRL+F – forward one window
CTRL+B – backward one window

GREP (Can use regular expressions)
$ grep -i "the" demo_file                               	searches for string in text file
$ grep -A 3 -i "example" demo_text            	Print the matched line, along with the 3 lines after it.
$ grep -r "ramesh" *                                       	Search for a given string in all files recursively
$ grep root /etc/passwd

SORT  sorts text file line by line
$ sort names.txt Sort a file in ascending order
$ sort -r names.txt  Sort a file in descending order
$ sort -t: -k 3n /etc/passwd | more  Sort passwd file by 3rd field.

DIFF
# diff -w name_list.txt name_list_new.txt   Ignore white space while comparing.

VI Text Editor
Vi file 	„:“ und „wq“ heisst write and quit
Aus der Hilfe kommt man auch mit : raus.

VIM
vim +143 filename.txt  Go to the 143rd line of file
$ vim +/search-term filename.txt    Go to the first match of the specified
$ vim -R /etc/passwd  Open the file in read only mode.


NANO
nano  file.txt

SED  & AWK 
texteditor and with scripting language http://linux-schule.com/
awk: is a little more specialized. Its specific strength is its ability to
manipulate tabular data.
