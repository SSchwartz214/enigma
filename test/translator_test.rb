require './test/test_helper'
require './lib/translator'

class TranslatorTest < Minitest::Test

  def test_it_exists
  assert_instance_of Translator, translator
  end

end
