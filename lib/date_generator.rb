require 'date'

class DateGenerator

  def initialize
  end

  def generate_date
    Time.now.strftime("%d%m%y").to_i
  end
end
