require './lib/enigma'
require './lib/key_generator'
require './lib/offset_calculator'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
key_generator = KeyGenerator.new
offset_calculator = OffsetCalculator.new

writer = File.open(ARGV[1], "w")
writer.write(enigma.encrypt(incoming_text))
writer.close

puts "Created 'encrypted.txt' with the key #{key_generator.key} and date #{offset_calculator.offset_values}"
