require './test_helper'

class CrackerTest < Minitest::Test

  def setup
    @encryption_abcd = Enigma.new.encrypt("abcd end", "08304", "280719")[:encryption]
    @encryption_bcda = Enigma.new.encrypt("abcde end", "08304", "280719")[:encryption]
    @encryption_cdab = Enigma.new.encrypt("abcdef end", "08304", "280719")[:encryption]
    @encryption_dabc = Enigma.new.encrypt("abcdefg end", "08304", "280719")[:encryption]
    @enigma = Enigma.new
    @crack_abcd = @enigma.crack(@encryption_abcd, "280719")[:decryption]
    @crack_bcda = @enigma.crack(@encryption_bcda, "280719")[:decryption]
    @crack_cdab = @enigma.crack(@encryption_cdab, "280719")[:decryption]
    @crack_dabc = @enigma.crack(@encryption_dabc, "280719")[:decryption]
  end


  def test_end_ord_diff
    assert_equal 5, @enigma.end_ord_diff("omlinpwi", 3, "d")
  end

  def test_cracked_message
    assert_equal "abcd end", @crack_abcd
    assert_equal "abcde end", @crack_bcda
    assert_equal "abcdef end", @crack_cdab
    assert_equal "abcdefg end", @crack_dabc
  end

end
