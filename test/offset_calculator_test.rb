require './test/test_helper'
require './lib/offset_calculator'

class OffsetCalulatorTest < Minitest::Test

  def test_it_exists
    offset_calculator = OffsetCalculator.new

    assert_instance_of OffsetCalculator, offset_calculator
  end

  def test_it_can_generate_current_date
    offset_calculator = OffsetCalculator.new

    assert_equal 4, offset_calculator.offset_values.length
    assert_instance_of Array, offset_calculator.offset_values
  end
end
