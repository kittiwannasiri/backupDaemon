# This is the backup script use for the automatic backup. 

The data were collected using  script based on Ruby and Cron Job schedule to collect information from the source in the File Server to Backup Server is specified by the destination path daily and monthly.

- What does it do? 
    
	This is script will be specify source path and destination path of daily and
monthly. The source path of the data from BK01_weekly
BK01_daily1 and BK01_daily2. After that the data will record to Adisk, Bdisk and MonthlyDisk in destination path

- How to use it. 

	Requirement of the script is Ruby V2.0.0 and Cron job in Linux system.
    		
	1. Figure out how to write the schedule for crontab
	2. Run backup cron job script 
       - Example: If you wished to have a script named /root/backup.sh run every day at 3am, your crontab entry would look like as follows. First, install your cronjob by running the following command:
                  crontab -e

	- Append the following entry:
                  0 3 * * * /root/backup.rb

- Who develop this application

- Copyright info
    The backup script run by RVM ruby and Cron Job.
