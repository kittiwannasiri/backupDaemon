class Read
  # attr_accessor :current_date
  def initialize
    @current_date = Time.now
  end
  def readPath(choose_path)
    daily = @current_date.wday
    case daily
    when 0
      puts "weekly"
      choose_path = "weekly"
      return choose_path
    when 1,3,5
      puts "daily1"
      choose_path = "daily1"
      return choose_path
    when 2,4,6
      puts "daily2"
      choose_path = "daily2"
      return choose_path
    end
  end
end
main = Read.new
puts main.readPath(@choose_path)
