require './test/test_helper'
require './lib/enigma'
require './lib/key_generator'
require './lib/offset_calculator'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new([4, 1, 5, 2, 1], 9225)

    assert_instance_of Enigma, enigma
  end

  def test_it_has_character_map
    enigma = Enigma.new([4, 1, 5, 2, 1], 9225)

    assert_equal (("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]), Enigma::CHARACTER_MAP
  end

  def test_it_can_generate_rotation_keys
    key_generator = KeyGenerator.new
    enigma = Enigma.new([4, 1, 5, 2, 1], 9225)

    assert_equal 41, enigma.a_rotation
    assert_equal 15, enigma.b_rotation
    assert_equal 52, enigma.c_rotation
    assert_equal 21, enigma.d_rotation
  end

  def test_it_can_generate_shifts
    key_generator = KeyGenerator.new
    offset_calculator = OffsetCalculator.new('0%o' % 020315)
    enigma = Enigma.new([4, 1, 5, 2, 1], 9225)

    assert_equal 50, enigma.a_shift
    assert_equal 17, enigma.b_shift
    assert_equal 54, enigma.c_shift
    assert_equal 26, enigma.d_shift
  end

  def test_it_can_convert_character_map_to_a_hash

    key_generator = KeyGenerator.new
    offset_calculator = OffsetCalculator.new('0%o' % 020315)
    enigma = Enigma.new([4, 1, 5, 2, 1], 9225)

    shift = enigma.a_shift
    assert_equal ["s"], enigma.shifted_character_map(shift).values_at("h")

  end

  def test_it_can_encrypt_a_letter
    key_generator = KeyGenerator.new
    offset_calculator = OffsetCalculator.new('0%o' % 020315)
    enigma = Enigma.new([4, 1, 5, 2, 1], 9225)

    shift = enigma.a_shift
    english_text = "h"
    assert_equal "s", enigma.encrypt(enigma.shifted_character_map(shift), english_text)
  end


end
