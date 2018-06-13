class Model

  def get_possible_moves(piece, location)
    raw_results = parse_input_data(piece, location)
    final_results = remove_impossible_moves(raw_results)
    return final_results
  end

  private

  def parse_input_data(piece, location)
    coords = parse_location_data(location)
    parse_piece_data(piece, coords)
  end

  def remove_impossible_moves(raw_results)
    possible_spaces = generate_possible_spaces
    results = []
    raw_results.each do |space|
      results << space if possible_spaces.include?(space)
    end
    return results
  end

  def generate_possible_spaces
    spaces = []
    8.times do |i|
      letter = ("a".ord+i).chr
      8.times do |j|
        spaces << [letter, j+1]
      end
    end
    return spaces
  end

  def parse_location_data(location)
    arr = []
    arr << location[0]
    arr << location[1].to_i
    return arr
  end

  def parse_piece_data(piece, coords)
    arr = []
    case piece
    when "king"
      arr << get_cardinals(1, coords)
    when "queen"
      arr << get_cardinals(7, coords)
      arr << get_diagonals(7, coords)
    when "rook"
      arr << get_cardinals(7, coords)
    when "knight"
      arr << get_knights(coords)
    when "bishop"
      arr << get_diagonals(7, coords)
    when "black pawn"
      arr << get_pawn("b", coords)
    when "white pawn"
      arr << get_pawn("w", coords)
    end
    return arr.flatten(1)
  end

  def get_cardinals(span, coords)
    arr = []
    span.times do |i|
      j = i + 1
      # get ups
      arr << [coords[0], coords[1]+j]
      # get downs
      arr << [coords[0], coords[1]-j]
      # get rights
      arr << [(coords[0].ord+j).chr, coords[1]]
      # get lefts
      arr << [(coords[0].ord-j).chr, coords[1]]
    end
    return arr
  end

  def get_diagonals(span, coords)
    arr = []
    span.times do |i|
      j = i + 1
      # get NE's
      arr << [(coords[0].ord+j).chr, coords[1]+j]
      # get SE's
      arr << [(coords[0].ord+j).chr, coords[1]-j]
      # get SW's
      arr << [(coords[0].ord-j).chr, coords[1]-j]
      # get NW's
      arr << [(coords[0].ord-j).chr, coords[1]+j]
    end
    return arr
  end

  def get_knights(coords)
    arr = []
    # get NW's
    arr << [(coords[0].ord-2).chr, coords[1]+1]
    arr << [(coords[0].ord-1).chr, coords[1]+2]
    # get NE's
    arr << [(coords[0].ord+1).chr, coords[1]+2]
    arr << [(coords[0].ord+2).chr, coords[1]+1]
    # get SE's
    arr << [(coords[0].ord+2).chr, coords[1]-1]
    arr << [(coords[0].ord+1).chr, coords[1]-2]
    # get SW's
    arr << [(coords[0].ord-1).chr, coords[1]-2]
    arr << [(coords[0].ord-2).chr, coords[1]-1]
    return arr
  end

  def get_pawn(color, coords)
    case color
    when "b"
      j = -1
    when "w"
      j = 1
    end
    return [[coords[0], coords[1]+j]]
  end

end

# King:
# up 1 + right 1 + down 1 + left 1

# Queen:
# up *7 + right *7 down *7 + left *7
# diagonal in 4 directions *7

# Rook:
# up *7 + right *7 down *7 + left *7

# Knight:
# up 2, left 1 + up 2, right 1 +
# up 1, left 2 + up 1, right 2 +
# down 1, left 2 + down 1, right 2 +
# down 2, left 1 + down 2, right 1

# Bishop:
# diagonal in 4 directions *7

# Black Pawn:
# down 1

# White Pawn:
# up 1
