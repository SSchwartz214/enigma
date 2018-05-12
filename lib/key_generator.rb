require 'date'

class KeyGenerator

  def initialize
  end

  def random_key
    # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].sample(5)

    5.times.map{rand(10)}
    binding.pry
  end

  def date_format
    Date.today.to_s

  end

end
