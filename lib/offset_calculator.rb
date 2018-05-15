require 'date'

class OffsetCalculator
  attr_reader :offset_values

  def initialize
    @offset_values = generate_offset_values
  end

  def generate_offset_values
    date = Time.now.strftime("%d%m%y").to_i

    date_squared = date ** 2
    date_string = date_squared.to_s
    last_four = date_string[-4..-1]
    last_four.chars.map(&:to_i)
  end
end
