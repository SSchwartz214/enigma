require './lib/key_generator'
require './lib/offset_calculator'

class Enigma
  attr_reader :key,
              :offset_values,
              :character_map

  def initialize(key = KeyGenerator.new.key, offset_values = OffsetCalculator.new.date)
    @key = key
    @offset_values = offset_values
    # .to_s.chars.map(&:to_i)
    @character_map = (
      ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
    )
  end

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

#delete rotation after we seperate in keygen and offsetcalc and just bring in shift
  def shift(index)
    @offset_values[index] + @key[index]
  end

  # def b_shift
  #   @offset_values[1] + b_rotation
  # end
  #
  # def c_shift
  #   @offset_values[2] + c_rotation
  # end
  #
  # def d_shift
  #   @offset_values[3] + d_rotation
  # end

  def shifted_character_map(shift)
    shifted_array = @character_map.rotate(shift)
    @character_map.zip(shifted_array).to_h
  end

    def message_encryptor(char, index)
      if index % 4 == 0
        char = shifted_character_map_hash_a[char]
      elsif index % 4 == 1
        char = shifted_character_map_hash_b[char]
      elsif index % 4 == 2
        char = shifted_character_map_hash_c[char]
      elsif index % 4 == 3
        char = shifted_character_map_hash_d[char]
      end
    end

    def shifted_character_map_hash(shift)
      shifted_character_map(shift)
    end

    # def shifted_character_map_hash_b
    #   shifted_character_map(b_shift)
    # end
    #
    # def shifted_character_map_hash_c
    #   shifted_character_map(c_shift)
    # end
    #
    # def shifted_character_map_hash_d
    #   shifted_character_map(d_shift)
    # end

  def encrypt(english_text)
    message = english_text.split("").map.with_index do |char, index|
      message_encryptor(char, index)
    end
    message.join
  end
end

# enigma = Enigma.new
# english_text = "turing is awesome."
# p enigma.encrypt(english_text)
