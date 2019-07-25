class Switchboard
  attr_reader :message, :key, :date

  def initialize(message, key = key_generator, date = Date::today)
    @message = message.downcase
    @key = key
    @date = date
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
    num = (rand(10).to_s + rand(10).to_s + rand(10).to_s + rand(10).to_s + rand(10).to_s).to_i
    @key_generator ||= num
  end

  def a_key
    key_generator[0..1].join.to_i + a_offset
  end

  def b_key
    key_generator[1..2].join.to_i + b_offset
  end

  def c_key
    key_generator[2..3].join.to_i + c_offset
  end

  def d_key
    key_generator[3..4].join.to_i + d_offset
  end

  def offset_num_from_date
    configured_date = @date.strftime.split("-")
    year = configured_date[0].chars.pop(2).join
    array = []
    array.push(configured_date[2], configured_date[1], year).flatten
    array.join.to_i
  end

  def offset
    num = (offset_num_from_date * offset_num_from_date)
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
