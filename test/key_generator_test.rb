require './test/test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    key_generator = KeyGenerator.new

    assert_instance_of KeyGenerator, key_generator
  end

  def test_it_generates_a_random_key_as_an_array
    key_generator = KeyGenerator.new

    assert_equal 4, key_generator.generate_key.length
    assert_instance_of Array, key_generator.key
  end
end
