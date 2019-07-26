class Enigma < Switchboard
  attr_reader :date, :key

  def encrypt(message, board_key = @key, board_date = @date)
    board = Switchboard.new(board_key, board_date)
    encryption = message.downcase.chars.each_with_index.map do |char, index|
      char.tr(alphabet.join, board.shift(index % 4))
    end.join
    output(:encryption, encryption, board_key, board_date)
  end

  def decrypt(message, board_key, board_date = @date)
    board = Switchboard.new(board_key, board_date)
    decryption = message.downcase.chars.each_with_index.map do |char, index|
      char.tr(board.shift(index % 4), alphabet.join)
    end.join
    output(:decryption, decryption, board_key, board_date)
  end

  def output(type, message, key, date)
    blurb = Hash.new
    blurb[type] = message
    blurb[:key] = key
    blurb[:date] = date
    blurb
  end

end
