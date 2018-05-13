require './test/test_helper'
require './lib/offset_calculator'
require './lib/key_generator'
require './lib/date_generator'

class OffsetCalulatorTest < Minitest::Test

  def test_it_has_a_key
    offset_calculator = OffsetCalculator.new(130518, [9, 3, 0, 5, 6])

    assert_equal 5, offset_calculator.key.length
  end

  def test_it_can_generate_current_date
    offset_calculator = OffsetCalculator.new(130518, [9, 3, 0, 5, 6])

    assert Integer, offset_calculator.date
  end

  def test_it_can_square_and_take_last_4_digits_of_date
    offset_calculator = OffsetCalculator.new(130518, [9, 3, 0, 5, 6])

    assert_equal 8324, offset_calculator.square_and_last_four
  end
end
