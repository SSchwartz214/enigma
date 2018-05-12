require './test/test_helper'
require './lib/offset_calculator'
require './lib/key_generator'

class OffsetCalulatorTest < Minitest::Test

  # def test_it_exists
  #   offset_calculator = OffsetCalculator.new(121212, 43438)
  #
  #   assert_instance_of OffsetCalculator, offset_calculator
  # end

  def test_it_can_bring_in_the_generated_key
    key_generator = KeyGenerator.new

    key = key_generator.generate_key

    offset_calculator = OffsetCalculator.new(121212, key)

    assert_equal 5, offset_calculator.key.length
  end

  def test_it_can_generate_current_date
    key_generator = KeyGenerator.new

    key = key_generator.generate_key

    offset_calculator = OffsetCalculator.new(121212, key)

    assert_equal 
  end


end
