class KeyGenerator
  attr_reader :key

  def initialize
    @key = generate_key
  end

  def generate_key
    random_number = rand(00000..99999).to_s.rjust(5, '0').chars

    key = []
    4.times do |index|
      key << (random_number[index] + random_number[index + 1]).to_i
    end
    key
  end
end
