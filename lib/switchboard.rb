class Switchboard

  attr_accessor :date, :key

  def initialize(key = KeyGenerator.key, date = DateGenerator.default_date)
    @date = date
    @key = key
  end

  def alphabet
    ("a".."z").to_a.push(" ")
  end

  def shift(index_mod4)
    alphabet.rotate(keys(index_mod4)).join
  end

  def keys(index_mod4)
    keysets[index_mod4] + offset(index_mod4)
  end

  def keysets
    @key.chars.each_cons(2).map {|num| num.join.to_i}
  end

  def offset(index_mod4)
    num = (@date.to_i * @date.to_i)
    final_num = num.to_s.chars.last(4)
    final_num[index_mod4].to_i
  end

  def crack_shift(diff)
    alphabet.rotate(diff)
  end

end
