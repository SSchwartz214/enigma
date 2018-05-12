require 'date'

class OffsetCalculator
  attr_reader :date,
              :key

  def initialize(date, key)
    @date = date
    @key = key
  end
end
