require 'date'
require 'pry'
require './lib/enigma'
require './lib/switchboard'
require './lib/date_generator'
require './lib/key_generator'
require './lib/cracker'

enigma = Enigma.new
message = File.readlines(ARGV[0], "r").join.chomp
decrypted_file = File.open(ARGV[1], "w")

enigma.decrypt(message, ARGV[2], ARGV[3])
decrypted_file.write(enigma.decrypt(message, ARGV[2], ARGV[3])[:decryption])

puts "Created decrypted.txt with the key #{enigma.decrypt(message, ARGV[2], ARGV[3])[:key]}, and date #{enigma.decrypt(message, ARGV[2], ARGV[3])[:date]}"
