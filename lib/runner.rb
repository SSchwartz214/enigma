require './lib/key_generator'
require './lib/date_generator'
require './lib/offset_calculator'

key_generator = KeyGenerator.new
key = key_generator.generate_key

date_generator = DateGenerator.new
date = date_generator.generate_date

offset_calculator = OffsetCalculator.new(date)
p offset_calculator
