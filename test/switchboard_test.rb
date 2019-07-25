require 'pry'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/switchboard'
require 'mocha/minitest'

class SwitchboardTest < Minitest::Test
# binding.pry

  def setup
    @switchboard = Switchboard.new("hi")
    @switchboard.stubs(:default_date).returns("250719")
    @switchboard.stubs(:key_generator).returns("07510")
  end

  def test_switchboard_exist
    assert_instance_of Switchboard, @switchboard
  end

  def test_attributes
    assert_equal "hi", @switchboard.message
    assert_equal "250719", @switchboard.date
  end

  def test_input_new_date
    switchboard_1 = Switchboard.new("hi", "020190")

    assert_equal "020190", switchboard_1.date
    assert_equal 20190, switchboard_1.date.to_i
  end

  def test_offset
    assert_equal [6,9,6,1], @switchboard.offset
    assert_equal 6, @switchboard.a_offset
    assert_equal 9, @switchboard.b_offset
    assert_equal 6, @switchboard.c_offset
    assert_equal 1, @switchboard.d_offset
  end

  def test_keys
    assert_equal 13, @switchboard.a_key
    assert_equal 84, @switchboard.b_key
    assert_equal 57, @switchboard.c_key
    assert_equal 11, @switchboard.d_key
  end

  def test_shift
    assert_equal "n", @switchboard.a_shift.first
    assert_equal "d", @switchboard.b_shift.first
    assert_equal "d", @switchboard.c_shift.first
    assert_equal "l", @switchboard.d_shift.first
  end
end
