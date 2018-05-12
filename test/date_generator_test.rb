require './test/test_helper'
require './lib/date_generator'

class DateGeneratorTest < Minitest::Test

  def test_it_can_generate_date
    date_generator = DateGenerator.new

    assert Integer, date_generator.generate_date
  end
end
