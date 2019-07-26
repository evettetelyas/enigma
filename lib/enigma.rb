class Enigma < Switchboard
  attr_reader :date, :key

  def encrypt(message, board_key = @key, board_date = @date)
    board = Switchboard.new(board_key, board_date)
    encryption = message.chars.each_with_index.map do |char, index|
      if index % 4 == 0
        char.tr(alphabet.join, board.a_shift)
      elsif index % 4 == 1
        char.tr(alphabet.join, board.b_shift)
      elsif index % 4 == 2
        char.tr(alphabet.join, board.c_shift)
      elsif index % 4 == 3
        char.tr(alphabet.join, board.d_shift)
      end
    end.join
    output(:encryption, encryption, board_key, board_date)
  end


  def decrypt(message, board_key, board_date = @date)
    board = Switchboard.new(board_key, board_date)
    decryption = message.chars.each_with_index.map do |char, index|
      if index % 4 == 0
        char.tr(board.a_shift, alphabet.join)
      elsif index % 4 == 1
        char.tr(board.b_shift, alphabet.join)
      elsif index % 4 == 2
        char.tr(board.c_shift, alphabet.join)
      elsif index % 4 == 3
        char.tr(board.d_shift, alphabet.join)
      end
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
