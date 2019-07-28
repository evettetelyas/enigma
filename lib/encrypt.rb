require 'date'
require 'pry'
require './lib/enigma'
require './lib/switchboard'
require './lib/date_generator'
require './lib/key_generator'
require './lib/cracker'

enigma = Enigma.new
message = File.readlines(ARGV[0], "r").join.chomp
encrypted_file = File.open(ARGV[1], "w")

enigma.encrypt(message)
encrypted_file.write(enigma.encrypt(message)[:encryption])

puts "Created encrypted.txt with the key #{enigma.encrypt(message)[:key]}, and date #{enigma.encrypt(message)[:date]}"
