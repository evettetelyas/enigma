require 'pry'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/switchboard'
require './lib/enigma'
require 'mocha/minitest'

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
    assert_equal "nopqrstuvwxyz abcdefghijklm", @switchboard.a_shift
    assert_equal "defghijklmnopqrstuvwxyz abc", @switchboard.b_shift
    assert_equal "defghijklmnopqrstuvwxyz abc", @switchboard.c_shift
    assert_equal "lmnopqrstuvwxyz abcdefghijk", @switchboard.d_shift
  end
end
