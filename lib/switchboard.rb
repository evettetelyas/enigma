class Switchboard
  attr_reader :date, :key

  def initialize(key = KeyGenerator.new.key, date = DateGenerator.new.default_date)
    @date = date
    @key = key
  end

  def alphabet
    ("a".."z").to_a.push(" ")
  end

  def shift(index)
    if index == 0
      alphabet.rotate(a_key).join
    elsif index == 1
      alphabet.rotate(b_key).join
    elsif index == 2
      alphabet.rotate(c_key).join
    elsif index == 3
      alphabet.rotate(d_key).join
    end
  end

  def a_key
    @key[0..1].to_i + a_offset
  end

  def b_key
    @key[1..2].to_i + b_offset
  end

  def c_key
    @key[2..3].to_i + c_offset
  end

  def d_key
    @key[3..4].to_i + d_offset
  end

  def offset
    num = (@date.to_i * @date.to_i)
    final_num = num.to_s.chars.last(4)
    final_num.map {|n| n.to_i}
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
