module Cracker

  def end_shift_ord_diff(message, index, char)
    letter_ord = [0,0]
    msg = message.chars.last(4)
    letter_ord[0] += msg[index].ord
    letter_ord[1] += char.ord
    (letter_ord[0] - letter_ord[1])
  end

  # def index_mod4
  #   0.upto(3).to_a
  # end

  def shift_abcd(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    message_data(message).map do |char, index|
      if index % 4 == 0
        char.tr((board.crack_shift(end_shift_ord_diff(message, 0, "{")).join), alphabet.join)
      elsif index % 4 == 1
        char.tr((board.crack_shift(end_shift_ord_diff(message, 1, "e")).join), alphabet.join)
      elsif index % 4 == 2
        char.tr((board.crack_shift(end_shift_ord_diff(message, 2, "n")).join), alphabet.join)
      elsif index % 4 == 3
        char.tr((board.crack_shift(end_shift_ord_diff(message, 3, "d")).join), alphabet.join)
      end
    end.join
  end

  def shift_bcda(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    message_data(message).map do |char, index|
      if index % 4 == 1
        char.tr((board.crack_shift(end_shift_ord_diff(message, 0, "{")).join), alphabet.join)
      elsif index % 4 == 2
        char.tr((board.crack_shift(end_shift_ord_diff(message, 1, "e")).join), alphabet.join)
      elsif index % 4 == 3
        char.tr((board.crack_shift(end_shift_ord_diff(message, 2, "n")).join), alphabet.join)
      elsif index % 4 == 0
        char.tr((board.crack_shift(end_shift_ord_diff(message, 3, "d")).join), alphabet.join)
      end
    end.join
  end

  def shift_cdab(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    message_data(message).map do |char, index|
      if index % 4 == 2
        char.tr((board.crack_shift(end_shift_ord_diff(message, 0, "{")).join), alphabet.join)
      elsif index % 4 == 3
        char.tr((board.crack_shift(end_shift_ord_diff(message, 1, "e")).join), alphabet.join)
      elsif index % 4 == 0
        char.tr((board.crack_shift(end_shift_ord_diff(message, 2, "n")).join), alphabet.join)
      elsif index % 4 == 1
        char.tr((board.crack_shift(end_shift_ord_diff(message, 3, "d")).join), alphabet.join)
      end
    end.join
  end

  def shift_dabc(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    message_data(message).map do |char, index|
      if index % 4 == 3
        char.tr((board.crack_shift(end_shift_ord_diff(message, 0, "{")).join), alphabet.join)
      elsif index % 4 == 0
        char.tr((board.crack_shift(end_shift_ord_diff(message, 1, "e")).join), alphabet.join)
      elsif index % 4 == 1
        char.tr((board.crack_shift(end_shift_ord_diff(message, 2, "n")).join), alphabet.join)
      elsif index % 4 == 2
        char.tr((board.crack_shift(end_shift_ord_diff(message, 3, "d")).join), alphabet.join)
      end
    end.join
  end

  def crack_message(message, board_date)
    if message.chars.count % 4 == 0
      shift_abcd(message, board_date)
    elsif message.chars.count % 4 == 1
      shift_bcda(message, board_date)
    elsif message.chars.count % 4 == 2
      shift_cdab(message, board_date)
    elsif message.chars.count % 4 == 3
      shift_dabc(message, board_date)
    end
  end

end
