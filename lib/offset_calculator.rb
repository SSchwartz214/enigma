require 'date'

class OffsetCalculator
  attr_reader :date,
              :key

  def initialize(date = Time.now.strftime("%d%m%y"), key)
    @date = date
    @key = key
  end

  def square_and_last_four
    date_squared = @date.to_i ** 2
    date_string = date_squared.to_s
    last_four = date_string[-4..-1].to_i
    # date_squared_string =
    # date_squared_string(-4..-1)
    binding.pry
  end

end
