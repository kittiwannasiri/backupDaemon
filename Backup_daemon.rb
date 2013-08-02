class BackupDaemon
  def initialize
     @today = Time.now
     @day = @today.day
     @month = @today.month
     @source_path = ""
     @destination_path = ""
  end
  def check_path
     disk = %w[bk01-weekly bk01-daily1 bk01-daily2 bk01-daily1 bk01-daily2 bk01-daily1 bk01-daily2]
     @source_path= disk[@today.wday]
     if @today.mon.even?
       @destination_path = "Bdisk"
     else
       @destination_path = "Adisk"
     end
  end
  def daily_backup
     if @day > 1
        `echo "start #{@today}" >> /mnt/#{@destination_path}/log`
        `rsync -rav --log-file=/mnt/#{@destination_path}/rsync-log.txt /mnt/#{@source_path}/it-backup/e/Accounting/ --delete /mnt/#{@destination_path}/#{@day}`
        check_size = `du -sh /mnt/#{@destination_path}/#{@day}`
        `echo "stop #{Time.now}  Total size= #{check_size}" >> /mnt/#{@destination_path}/log`
     end
  end
  def monthly_backup
     if @day == 1 
       `echo "start #{@today}" >> /mnt/monthly/log`
       `rsync -ra --log-file=/mnt/monthly/rsync-log.txt /mnt/#{@source_path}/it-backup/e/Accounting/  --delete /mnt/monthly/#{@month}`
     check_size = `du -sh /mnt/monthly/#{@month}`
     `echo "stop #{Time.now}  Total size= #{check_size}" >> /mnt/monthly/log`
     end
  end
end

d_backup = BackupDaemon.new
d_backup.check_path
d_backup.daily_backup
d_backup.monthly_backup

