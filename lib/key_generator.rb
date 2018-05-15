class KeyGenerator
  attr_reader :key

  def initialize
    @key = (0..9).to_a.sample(5)
  end
end
