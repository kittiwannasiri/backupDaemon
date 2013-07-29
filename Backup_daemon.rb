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
       @destination_path = "Adisk"
     else
       @destination_path = "Bdisk"
     end
  end
  def daily_backup
     puts "rsync -ra /mnt/#{@source_path}  --delete /mnt/#{@destination_path}/#{@day}"
  end
  def monthly_backup
     if @day == 1 
     puts "rsync -ra /mnt/#{@source_path}  --delete /mnt/monthly/#{@month}"
     end
  end
end

d_backup = BackupDaemon.new
d_backup.check_path
d_backup.daily_backup
d_backup.monthly_backup

