require './test/test_helper'
require './lib/enigma'
require './lib/key_generator'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new([4, 1, 5, 2, 1])

    assert_instance_of Enigma, enigma
  end

  def test_it_has_character_map
    enigma = Enigma.new([4, 1, 5, 2, 1])

    assert_equal (("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]), Enigma::CHARACTER_MAP
  end

  def test_it_can_generate_rotation_keys
    key_generator = KeyGenerator.new
    enigma = Enigma.new([4, 1, 5, 2, 1])

    assert_equal 41, enigma.a_rotation
    assert_equal 15, enigma.b_rotation
    assert_equal 52, enigma.c_rotation
    assert_equal 21, enigma.d_rotation
  end

  def test_it_can_generate_offset_values
    skip
    offset_calculator = OffsetCalculator.new(130518)
    enigma = Enigma.new([4, 1, 5, 2, 1])

  end

end
