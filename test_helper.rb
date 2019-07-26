require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

require 'pry'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/switchboard'
require './lib/key_generator'
require './lib/date_generator'
require './lib/enigma'
require 'mocha/minitest'
