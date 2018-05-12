require 'date'

class KeyGenerator

  def initialize
  end

  def generate_key
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(5)

    # 5.times.map{rand(10)}

  end



end
