require 'pry'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/switchboard'
require './lib/key_generator'
require './lib/date_generator'
require './lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  binding.pry

  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exist
    assert_instance_of Enigma, @enigma
  end

  def test_encryption
    assert_equal "sea", @enigma.encrypt("abc", "12190", "250719")[:encryption]
  end

  def test_decryption
    assert_equal "abc", @enigma.decrypt("sea", "12190", "250719")[:decryption]
  end

  def test_output
    expected = {:encryption=>"sea", :key=>"12190", :date=>"250719"}

    assert_equal expected, @enigma.encrypt("abc", "12190", "250719")
  end

end
