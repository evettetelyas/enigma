require './test_helper'

class CrackerTest < Minitest::Test

  def setup
    @encryption_abcd = Enigma.new.encrypt("abcd end", "08304", "280719")[:encryption]
    @encryption_bcda = Enigma.new.encrypt("abcde end", "08304", "280719")[:encryption]
    @encryption_cdab = Enigma.new.encrypt("abcdef end", "08304", "280719")[:encryption]
    @encryption_dabc = Enigma.new.encrypt("abcdefg end", "08304", "280719")[:encryption]
    @enigma = Enigma.new
  end

  def test_shift_ary
    assert_equal [0,1,2,3], @enigma.shift_ary
  end

  def test_end_shift
    assert_equal "abcd end", @enigma.end_shift(@encryption_abcd, "280719", 0)
  end

  def test_end_ord_diff
    assert_equal 5, @enigma.end_ord_diff("omlinpwi", 3, "d")
  end

  def test_cracked_message
    assert_equal "abcd end", @enigma.crack_message(@encryption_abcd, "280719")
    assert_equal "abcde end", @enigma.crack_message(@encryption_bcda, "280719")
    assert_equal "abcdef end", @enigma.crack_message(@encryption_cdab, "280719")
    assert_equal "abcdefg end", @enigma.crack_message(@encryption_dabc, "280719")
  end

end
