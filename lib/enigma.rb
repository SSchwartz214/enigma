class Enigma

  def initialize(key, offset_values)
    @key = key
    @offset_values = offset_values.to_s.chars.map(&:to_i)
  end

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

  def encrypt(english_text)
    index = CHARACTER_MAP.find_index(english_text)
    shifted_index = index + a_shift
    CHARACTER_MAP[shifted_index]
    binding.pry
  end


end
