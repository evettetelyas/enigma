class Switchboard

  attr_reader :message, :date, :key

  def initialize(message, date = default_date)
    @message = message.downcase
    @date = date
    @key = key_generator
  end

  def default_date
    array = []
    configured_date = Date::today.strftime.split("-")
    year = configured_date[0].chars.pop(2).join
    array.push(configured_date[2], configured_date[1], year).flatten
    array.join
  end

  def a_shift
    "a".upto("z").to_a.push(" ").rotate(a_key)
  end

  def b_shift
    "a".upto("z").to_a.push(" ").rotate(b_key)
  end

  def c_shift
    "a".upto("z").to_a.push(" ").rotate(c_key)
  end

  def d_shift
    "a".upto("z").to_a.push(" ").rotate(d_key)
  end

  def key_generator
    num = (rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s + rand(0..9).to_s)
    @key_generator ||= num
  end

  def a_key
    key_generator[0..1].to_i + a_offset
  end

  def b_key
    key_generator[1..2].to_i + b_offset
  end

  def c_key
    key_generator[2..3].to_i + c_offset
  end

  def d_key
    key_generator[3..4].to_i + d_offset
  end

  def offset
    num = (@date.to_i * @date.to_i)
    final_num = num.to_s.chars.last(4)
    final_num.map {|num| num.to_i}
  end

  def a_offset
    offset[0]
  end

  def b_offset
    offset[1]
  end

  def c_offset
    offset[2]
  end

  def d_offset
    offset[3]
  end

end
