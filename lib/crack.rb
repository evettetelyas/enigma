require 'date'
require 'pry'
require './lib/enigma'
require './lib/switchboard'
require './lib/date_generator'
require './lib/key_generator'
require './lib/cracker'

enigma = Enigma.new
message = File.readlines(ARGV[0], "r").join.chomp
cracked_file = File.open(ARGV[1], "w")

enigma.crack(message, ARGV[2])
cracked_file.write(enigma.crack(message, ARGV[2])[:decryption])

puts "Created #{ARGV[1]} with the key #{enigma.crack(message, ARGV[2])[:key]}, and date #{enigma.crack(message, ARGV[2])[:date]}"
