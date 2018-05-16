require './test/test_helper'
require './lib/enigma'
require './lib/key_generator'
require './lib/offset_calculator'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_instance_of Enigma, enigma
  end

  def test_it_has_correct_defualt_values
    enigma = Enigma.new

    assert_instance_of Array, enigma.key
    assert_instance_of Array, enigma.offset_values
  end

  def test_it_has_character_map
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_equal (("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]), enigma.character_map
  end

  def test_it_can_convert_character_map_to_a_hash
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_equal 39, enigma.shifted_character_map(0).count
    assert_instance_of Hash, enigma.shifted_character_map(0)
  end

  def test_it_can_create_a_shift_number
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_instance_of Integer, enigma.shift(3)
  end

  def test_it_can_generate_shifts
    key_generator = KeyGenerator.new
    # offset_calculator = OffsetCalculator.new.offset_values
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_equal 50, enigma.shift(0)
    assert_equal 17, enigma.shift(1)
    assert_equal 54, enigma.shift(2)
    assert_equal 26, enigma.shift(3)
  end

  def test_it_can_encrypt_a_letter
    key_generator = KeyGenerator.new
    offset_calculator = OffsetCalculator.new
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_equal "s", enigma.encrypt("h")
  end

  def test_it_can_encrypt_several_letters
    key_generator = KeyGenerator.new
    offset_calculator = OffsetCalculator.new
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_equal "sv0.z", enigma.encrypt("hello")
  end

  def test_it_can_encrypt_two_words
    key_generator = KeyGenerator.new
    offset_calculator = OffsetCalculator.new
    enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])

    assert_equal "sv0.zo.b22s", enigma.encrypt("hello world")
  end
end
