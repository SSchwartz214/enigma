require 'date'

class OffsetCalculator
  attr_reader :key

  def initialize(date, key)
    @date = date
    @key = key
  end
end
