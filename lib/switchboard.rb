class Switchboard
  attr_reader :date, :key

  def initialize(key = KeyGenerator.new.key, date = DateGenerator.new.default_date)
    @date = date
    @key = key
  end

  def alphabet
    ("a".."z").to_a.push(" ")
  end

  def shift(index_mod4)
    alphabet.rotate(key(index_mod4)).join
  end

  def key(index_mod4)
    @key[(index_mod4)..(index_mod4+1)].to_i + offset(index_mod4)
  end

  def offset(index_mod4)
    num = (@date.to_i * @date.to_i)
    final_num = num.to_s.chars.last(4)
    final_num[index_mod4].to_i
  end

end
