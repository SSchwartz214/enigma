require './lib/key_generator'
require './lib/offset_calculator'

class Enigma
  attr_reader :key,
              :offset_values,
              :character_map

  def initialize(key = KeyGenerator.new.key, offset_values = OffsetCalculator.new.offset_values)
    @key = key
    @offset_values = offset_values
    @character_map = (
      ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
    )
    @ciphered_character_map = @character_map.reverse
  end

  def shifted_character_map(letter_index)
    rotation = shift(letter_index)
    shifted_array = @character_map.rotate(rotation)
    @character_map.zip(shifted_array).to_h
  end

  def shift(index)
    @key[index] + @offset_values[index]
  end

  def message_encryptor(char, index)
    shifted_character_map(index % 4)[char]
  end

  def encrypt(english_text)
    message = english_text.split("").map.with_index do |char, index|
      message_encryptor(char, index)
    end
    message.join
  end

  def decrypt(ciphered_text)
    message = ciphered_text.split("").map.with_index do |char, index|
      message_decryptor(char, index)
    end
    message.join
  end

  def message_decryptor(char, index)
    shifted_ciphered_character_map(index % 4)[char]
  end

  def shifted_ciphered_character_map(letter_index)
    rotation = shift(letter_index)
    shifted_array = @ciphered_character_map.rotate(rotation)
    @ciphered_character_map.zip(shifted_array).to_h
  end
  ##########################################################
  def crack_key(ciphered_text)
    @key = [0, 0, 0, 0, 0]
    until decrypt(ciphered_text)[-7..-1] == "..end.."
      (@key + 1).to_s.rjust(5, '0')
    end
  end
end
