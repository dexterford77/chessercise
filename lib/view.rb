class View

  def get_piece
    puts " "
    puts "Chess pieces: King, Queen, Rook, Knight, Bishop, White Pawn, Black Pawn."
    puts "Choose a piece."
    input = gets.chomp.downcase
    check_piece_input_validity(input)
  end

  def get_location
    display_possible_locations
    puts "Choose a current position (ie, A8, E1, etc)."
    input = gets.chomp.downcase
    check_location_input_validity(input)
  end

  def display_results(results, current_location)
    puts "                                       "
    puts "     A   B   C   D   E   F   G   H     "
    puts "   ---------------------------------   "
    ("1".."8").to_a.reverse.each do |n|
      str = " #{n.to_s} | "
      ("a".."h").to_a.each do |l|
        if results.include? ([l, n.to_i])
          str << "O"
        elsif current_location[0] == l && current_location[1] == n
          str << "X"
        else
          str << " "
        end
        str << " | "
      end
      str << "#{n} "
      puts str
      puts "   ---------------------------------   "
    end
    puts "     A   B   C   D   E   F   G   H     "
    puts "                                       "
    puts "X = Your current location: " + current_location.upcase
    possible_moves = format_possible_moves(results)
    puts "O = Your possible moves ('O'): #{possible_moves.upcase}"
  end

  def ask_if_continue
    puts " "
    puts "Continue? (Y/N)"
    answer = gets.chomp.upcase
    return answer
  end

  private

  def display_possible_locations
    puts "                                       "
    puts "     A   B   C   D   E   F   G   H     "
    puts "   ---------------------------------   "
    puts " 8 |   |   |   |   |   |   |   |   | 8 "
    puts "   ---------------------------------   "
    puts " 7 |   |   |   |   |   |   |   |   | 7 "
    puts "   ---------------------------------   "
    puts " 6 |   |   |   |   |   |   |   |   | 6 "
    puts "   ---------------------------------   "
    puts " 5 |   |   |   |   |   |   |   |   | 5 "
    puts "   ---------------------------------   "
    puts " 4 |   |   |   |   |   |   |   |   | 4 "
    puts "   ---------------------------------   "
    puts " 3 |   |   |   |   |   |   |   |   | 3 "
    puts "   ---------------------------------   "
    puts " 2 |   |   |   |   |   |   |   |   | 2 "
    puts "   ---------------------------------   "
    puts " 1 |   |   |   |   |   |   |   |   | 1 "
    puts "   ---------------------------------   "
    puts "     A   B   C   D   E   F   G   H     "
    puts "                                       "
  end

  def format_possible_moves(arr)
    str = ""
    arr.sort.each do |move|
      str << move[0].upcase + move[1].to_s + ", "
    end
    return str [0...-2]
  end

  def check_piece_input_validity(input)
    if valid_piece?(input)
      return input
    else
      puts " "
      puts "Does not compute. Please try again using correct spelling & no punctuation."
      self.get_piece
    end
  end

  def valid_piece?(input)
    valid_pieces = ["king", "queen", "rook", "knight", "bishop", "white pawn", "black pawn"]
    valid_pieces.include?(input) ? true : false
  end

  def check_location_input_validity(input)
    if valid_location?(input)
      return input
    else
      puts " "
      puts "Does not compute. Please try again, typing a valid letter followed by a valid number (no spaces & no punctuation)."
      self.get_location
    end
  end

  def valid_location?(input)
    valid_location_letters = ("a".."h").to_a
    valid_location_numbers = (1..8).to_a
    valid_location_letters.include?(input[0]) && valid_location_numbers.include?(input[1].to_i) && input.length < 3 ? true : false
  end

end