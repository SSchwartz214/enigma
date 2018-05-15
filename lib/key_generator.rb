class KeyGenerator
  attr_reader :key

  def initialize
    #change method so we can have repeat numbers
    @key = (0..9).to_a.sample(5)
  end
end
