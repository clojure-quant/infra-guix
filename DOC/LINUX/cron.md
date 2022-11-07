CRON (Task Scheduler)

crontab -l	list current cron entries
crontab -e	edit cron entries
crontab -u john –l View crontab entry for a specific user

*/10 * * * * /home/ramesh/check-disk-space  Schedule a cron job every 10 minutes.
at -f backup.sh 10 am tomorrow  tomorrow 10am run this script

crontab cron-file.txt   create new cron settings file from a text file.
crontab -r   remove all entries for the current user

crontab -l > cron.backup 		backup cron jobs

Twice a day job:
00 11,16 * * * /home/ramesh/bin/incremental-backup


Once per hour during working hours:
00 09-18 * * * /home/ramesh/bin/check-db-status


Once per hour during working hours, monday till friday
00 09-18 * * 1-5 /home/ramesh/bin/check-db-status
Using the @reboot cron keyword, this will execute the specified command once after the machine got booted every time.
@reboot CMD
grep CRON /var/log/syslog
Print cron jobs, for citi user:
cat /var/log/syslog | grep "CRON.*citi" 
