require './test/test_helper'
require './lib/offset_calculator'

class OffsetCalulatorTest < Minitest::Test

  def test_it_exists
    offset_calculator = OffsetCalculator.new("020315")

    assert_instance_of OffsetCalculator, offset_calculator
  end

  def test_it_can_generate_current_date
    offset_calculator = OffsetCalculator.new("020315")

    assert Integer, offset_calculator.date
  end

  def test_it_can_have_correct_current_date_by_default
    offset_calculator = OffsetCalculator.new

    assert_equal Time.now.strftime("%d%m%y").to_i, offset_calculator.date
  end

  def test_it_can_square_and_take_last_4_digits_of_date

    offset_calculator = OffsetCalculator.new("020315")

    assert_equal 9225, offset_calculator.offset_values
  end
end
