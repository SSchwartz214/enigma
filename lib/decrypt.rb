require './lib/enigma'
require './lib/key_generator'
require './lib/offset_calculator'

handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new([41, 15, 52, 21], [9, 2, 2, 5])
key_generator = KeyGenerator.new
offset_calculator = OffsetCalculator.new

writer = File.open(ARGV[1], "w")
writer.write(enigma.decrypt(incoming_text))
writer.close

puts "Created 'decrypted.txt' with the key #{key_generator.key} and date #{offset_calculator.offset_values}"
