require 'date'

class OffsetCalculator
  attr_reader :date

  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date.to_i
  end

  def offset_values
    date_squared = @date ** 2
    date_string = date_squared.to_s
    date_string[-4..-1].to_i
  end


end
