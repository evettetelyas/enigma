class KeyGenerator

  def self.key
    num = ""
    5.times do
      num << rand(0..9).to_s
    end
    num
  end

end
