require 'file'
require './lib/enigma'
require './lib/encrypt'
require './lib/switchboard'
require './lib/date_generator'
require './lib/key_generator'

enigma = Enigma.new

File.read(message.txt){|line| enigma.encrypt(line)}

File.new(encrypted.txt).write(encrypted.txt, enigma.encrypt[:encryption])

puts "Created encrypted.txt with the key #{enigma.encrypt[:key]}, and date #{enigma.encrypt[:date]}"
