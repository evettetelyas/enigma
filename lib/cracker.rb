module Cracker

  def end_ord_diff(message, index, char)
    letter_ord = [0,0]
    msg = message.chars.last(4)
    letter_ord[0] += msg[index].ord
    letter_ord[1] += char.ord
    (letter_ord[0] - letter_ord[1])
  end

  def shift_type(message)
    message.chars.count % 4
  end

  def shift_ary
    0.upto(3).to_a
  end

  def end_shift(message, board_date, shift_type)
    board = Switchboard.new(KeyGenerator.key, board_date)
    message_data(message).map do |char, index|
      if index % 4 == shift_ary.rotate(shift_type)[0]
        char.tr((board.crack_shift(end_ord_diff(message, 0, "{")).join), alphabet.join)
      elsif index % 4 == shift_ary.rotate(shift_type)[1]
        char.tr((board.crack_shift(end_ord_diff(message, 1, "e")).join), alphabet.join)
      elsif index % 4 == shift_ary.rotate(shift_type)[2]
        char.tr((board.crack_shift(end_ord_diff(message, 2, "n")).join), alphabet.join)
      elsif index % 4 == shift_ary.rotate(shift_type)[3]
        char.tr((board.crack_shift(end_ord_diff(message, 3, "d")).join), alphabet.join)
      end
    end.join
  end

  def crack_message(message, board_date)
    if shift_type(message) == 0
      end_shift(message, board_date, 0)
    elsif shift_type(message) == 1
      end_shift(message, board_date, 1)
    elsif shift_type(message) == 2
      end_shift(message, board_date, 2)
    elsif shift_type(message) == 3
      end_shift(message, board_date, 3)
    end
  end

end
