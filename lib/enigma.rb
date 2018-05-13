class Enigma

  def initialize(key)
    @key = key
  end

  CHARACTER_MAP = (
    ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
  )

  def a_rotation
    a_rotation = []
    a_rotation << @key[0] << @key[1]
    a_key = a_rotation.join.to_i
  end

  def b_rotation
    b_rotation = []
    b_rotation << @key[1] << @key[2]
    b_key = b_rotation.join.to_i
  end

  def c_rotation
    c_rotation = []
    c_rotation << @key[2] << @key[3]
    c_key = c_rotation.join.to_i
  end

  def d_rotation
    d_rotation = []
    d_rotation << @key[3] << @key[4]
    d_key = d_rotation.join.to_i
  end

  def a_offset
    

  end

  def b_offset

  end


end
