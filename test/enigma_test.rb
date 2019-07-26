require './test_helper'

class EnigmaTest < Minitest::Test

   def setup
    @enigma = Enigma.new
  end

  def test_enigma_exist
    assert_instance_of Enigma, @enigma
  end

  def test_encryption
    assert_equal "sean", @enigma.encrypt("abcd", "12190", "250719")[:encryption]
  end

  def test_decryption
    assert_equal "abcd", @enigma.decrypt("sean", "12190", "250719")[:decryption]
  end

  def test_output
    expected = {:encryption=>"sea", :key=>"12190", :date=>"250719"}

    assert_equal expected, @enigma.encrypt("abc", "12190", "250719")
  end

end
