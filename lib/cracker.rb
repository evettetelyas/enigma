module Cracker

  def space_shift_ord_diff(message)
    letter_ord = [0,0]
    msg = message.chars.last(4)
    letter_ord[0] += msg[0].ord
    letter_ord[1] += "{".ord
    letter_ord.map {|ord| ord - 97}
    (letter_ord[0] - letter_ord[1])
  end

  def e_shift_ord_diff(message)
    letter_ord = [0,0]
    msg = message.chars.last(4)
    letter_ord[0] += msg[1].ord
    letter_ord[1] += "e".ord
    letter_ord.map {|ord| ord - 97}
    (letter_ord[0] - letter_ord[1])
  end

  def n_shift_ord_diff(message)
    letter_ord = [0,0]
    msg = message.chars.last(4)
    letter_ord[0] += msg[2].ord
    letter_ord[1] += "n".ord
    letter_ord.map {|ord| ord - 97}
    (letter_ord[0] - letter_ord[1])
  end

  def d_shift_ord_diff(message)
    letter_ord = [0,0]
    msg = message.chars.last(4)
    letter_ord[0] += msg[3].ord
    letter_ord[1] += "d".ord
    letter_ord.map {|ord| ord - 97}
    (letter_ord[0] - letter_ord[1])
  end

  def shift_abcd_cracked_keys(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    msg = message.chars.last(4).join
    decryption = message_data(message).map do |char, index|
      if index % 4 == 0
        char.tr((board.crack_shift(space_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 1
        char.tr((board.crack_shift(e_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 2
        char.tr((board.crack_shift(n_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 3
        char.tr((board.crack_shift(d_shift_ord_diff(message)).join), alphabet.join)
      end
    end.join
  end

  def shift_bcda_cracked_keys(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    msg = message.chars.last(4).join
    decryption = message_data(message).map do |char, index|
      if index % 4 == 1
        char.tr((board.crack_shift(space_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 2
        char.tr((board.crack_shift(e_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 3
        char.tr((board.crack_shift(n_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 0
        char.tr((board.crack_shift(d_shift_ord_diff(message)).join), alphabet.join)
      end
    end.join
  end

  def shift_cdab_cracked_keys(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    msg = message.chars.last(4).join
    decryption = message_data(message).map do |char, index|
      if index % 4 == 2
        char.tr((board.crack_shift(space_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 3
        char.tr((board.crack_shift(e_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 0
        char.tr((board.crack_shift(n_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 1
        char.tr((board.crack_shift(d_shift_ord_diff(message)).join), alphabet.join)
      end
    end.join
  end

  def shift_dabc_cracked_keys(message, board_date)
    board = Switchboard.new(KeyGenerator.key, board_date)
    msg = message.chars.last(4).join
    decryption = message_data(message).map do |char, index|
      if index % 4 == 3
        char.tr((board.crack_shift(space_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 0
        char.tr((board.crack_shift(e_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 1
        char.tr((board.crack_shift(n_shift_ord_diff(message)).join), alphabet.join)
      elsif index % 4 == 2
        char.tr((board.crack_shift(d_shift_ord_diff(message)).join), alphabet.join)
      end
    end.join
  end

  def crack_message(message, board_date)
    if message.chars.count % 4 == 0
      shift_abcd_cracked_keys(message, board_date)
    elsif message.chars.count % 4 == 1
      shift_bcda_cracked_keys(message, board_date)
    elsif message.chars.count % 4 == 2
      shift_cdab_cracked_keys(message, board_date)
    elsif message.chars.count % 4 == 3
      shift_dabc_cracked_keys(message, board_date)
    end
  end

end
