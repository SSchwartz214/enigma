class Enigma
  attr_reader :key,
              :offset_values

  def initialize(key = KeyGenerator.new.key, offset_values = OffsetCalculator.new.date)
    @key = key
    @offset_values = offset_values.to_s.chars.map(&:to_i)
  end
# make an instance variable or add to own class
  CHARACTER_MAP = (
    ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  )

  def a_rotation
    a_rotation = []
    a_rotation << @key[0] << @key[1]
    a_rotation.join.to_i
  end

  def b_rotation
    b_rotation = []
    b_rotation << @key[1] << @key[2]
    b_rotation.join.to_i
  end

  def c_rotation
    c_rotation = []
    c_rotation << @key[2] << @key[3]
    c_rotation.join.to_i
  end

  def d_rotation
    d_rotation = []
    d_rotation << @key[3] << @key[4]
    d_rotation.join.to_i
  end

  def a_shift
    @offset_values[0] + a_rotation
  end

  def b_shift
    @offset_values[1] + b_rotation
  end

  def c_shift
    @offset_values[2] + c_rotation
  end

  def d_shift
    @offset_values[3] + d_rotation
  end

  def shifted_character_map(shift)
    shifted_array = CHARACTER_MAP.rotate(shift)
    CHARACTER_MAP.zip(shifted_array).to_h
  end

  def encrypt(english_text)
    hash_1 = shifted_character_map(a_shift)
    hash_2 = shifted_character_map(b_shift)
    hash_3 = shifted_character_map(c_shift)
    hash_4 = shifted_character_map(d_shift)

    message = english_text.split("").map.with_index do |char, index|
      if index % 4 == 0
        char = hash_1[char]
      elsif index % 4 == 1
        char = hash_2[char]
      elsif index % 4 == 2
        char = hash_3[char]
      elsif index % 4 == 3
        char = hash_4[char]
      end
    end
    message.join
  end
end
