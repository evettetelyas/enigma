require './test_helper'

class GeneratorTest < Minitest::Test

  def setup
    @random_key = KeyGenerator.key
    @today = DateGenerator.default_date
  end

  def test_key_gen_exist
    assert_instance_of KeyGenerator, @random_key
    assert_instance_of DateGenerator, @today
  end

  def test_attributes
    assert_equal 5, @random_key.chars.count
    assert_equal 6, @today.chars.count
  end

end
