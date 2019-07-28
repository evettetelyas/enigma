require './test_helper'

class SwitchboardTest < Minitest::Test

  def setup
    @switchboard = Switchboard.new("07510", "250719")
    @switchboard_1 = Switchboard.new("12345", "020190")
  end

  def test_switchboard_exist
    assert_instance_of Switchboard, @switchboard
  end

  def test_attributes
    assert_equal "250719", @switchboard.date
  end

  def test_input_new_date
    assert_equal "020190", @switchboard_1.date
    assert_equal 20190, @switchboard_1.date.to_i
  end

  def test_offset
    assert_equal 6, @switchboard.offset(0)
    assert_equal 9, @switchboard.offset(1)
    assert_equal 6, @switchboard.offset(2)
    assert_equal 1, @switchboard.offset(3)
  end

  def test_keys
    assert_equal 13, @switchboard.keys(0)
    assert_equal 84, @switchboard.keys(1)
    assert_equal 57, @switchboard.keys(2)
    assert_equal 11, @switchboard.keys(3)
  end

  def test_shift
    assert_equal "nopqrstuvwxyz abcdefghijklm", @switchboard.shift(0)
    assert_equal "defghijklmnopqrstuvwxyz abc", @switchboard.shift(1)
    assert_equal "defghijklmnopqrstuvwxyz abc", @switchboard.shift(2)
    assert_equal "lmnopqrstuvwxyz abcdefghijk", @switchboard.shift(3)
  end

  def test_crack_shift
    assert_equal "bcdefghijklmnopqrstuvwxyz a", @switchboard.crack_shift(1).join
  end
end
