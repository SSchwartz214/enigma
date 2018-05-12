require './test/test_helper'
require './lib/offset_calculator'
require './lib/key_generator'
require './lib/date_generator'

class OffsetCalulatorTest < Minitest::Test

  def test_it_can_bring_in_the_generated_key_and_date
    date_generator = DateGenerator.new
    date = date_generator.generate_date

    key_generator = KeyGenerator.new
    key = key_generator.generate_key

    offset_calculator = OffsetCalculator.new(date, key)

    assert Integer, offset_calculator.date
    assert_equal 5, offset_calculator.key.length
  end

end
