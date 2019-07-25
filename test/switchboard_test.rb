require 'pry'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/switchboard'
require 'mocha'

class SwitchboardTest < Minitest::Test
binding.pry
  def setup
    @switchboard = Switchboard.new("hi", date = 190725)
  end

  def test_switchboard_exist
    assert_instance_of Switchboard, @switchboard
  end

  def test_attributes
    assert_equal "hi", @switchboard.message
    assert_equal "2019-07-25", @switchboard.date.strftime
  end

  # def test_key_generator
  #   stub(:key_generator => 12345)
  # end

  # def test_offset_num_from_date
  #   stub(@switchboard.date => <Date: 2019-07-25 ((2458690j,0s,0n),+0s,2299161j)>)
  #
  #   assert_equal
  # end

  def test_offset

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
