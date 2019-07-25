require 'pry'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/switchboard'

class SwitchboardTest < Minitest::Test

  def setup
    @switchboard = Switchboard.new("hi")
  end

  def test_switchboard_exist
    assert_instance_of Switchboard, @switchboard
  end

  def test_attributes
    assert_equal "hi", @switchboard.message
    assert_equal "2019-07-25", @switchboard.date.strftime
  end

  def test_key_generator
    #add mock and stub
  end

  def test_offset
    #add mock and stub
  end

  def test_offset_num_from_date
    #add mock and stub
  end

  def test_a_offset
    #add mock and stub
  end

  def test_b_offset
    #add mock and stub
  end

  def test_c_offset
    #add mock and stub
  end

  def test_d_offset
    #add mock and stub
  end

  def test_a_key
    #add mock and stub
  end

  def test_b_key
    #add mock and stub
  end

  def test_c_key
    #add mock and stub
  end

  def test_d_key
    #add mock and stub
  end

  def test_a_shift
    #add mock and stub
  end

  def test_b_shift
    #add mock and stub
  end

  def test_c_shift
    #add mock and stub
  end

  def test_d_shift
    #add mock and stub
  end
end
