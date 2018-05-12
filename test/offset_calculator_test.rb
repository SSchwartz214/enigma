require './test/test_helper'
require './lib/offset_calculator'
require './lib/key_generator'

class OffsetCalulatorTest < Minitest::Test

  # def test_it_exists
  #   offset_calculator = OffsetCalculator.new(121212, 43438)
  #
  #   assert_instance_of OffsetCalculator, offset_calculator
  # end

  def test_it_has_the_key
    key_generator = KeyGenerator.new

    key = key_generator.generate_key

    offset_calculator = OffsetCalculator.new(121212, key)

    assert_equal 5, key_generator.generate_key.length

  end


end
