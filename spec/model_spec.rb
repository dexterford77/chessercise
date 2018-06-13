require 'model'

describe Model do

  let(:model) { Model.new }

  describe "#get_possible_moves" do

    it "returns correct possible moves for a King" do 
      expect(model.get_possible_moves("king", "d4").sort)
        .to eq([["c", 4], ["d", 3], ["d", 5], ["e", 4]])
    end

    it "returns correct possible moves for a Queen" do 
      expect(model.get_possible_moves("queen", "d4").sort)
        .to eq([["a", 1], ["a", 4], ["a", 7], ["b", 2], ["b", 4], ["b", 6], ["c", 3], ["c", 4], ["c", 5], ["d", 1], ["d", 2], ["d", 3], ["d", 5], ["d", 6], ["d", 7], ["d", 8], ["e", 3], ["e", 4], ["e", 5], ["f", 2], ["f", 4], ["f", 6], ["g", 1], ["g", 4], ["g", 7], ["h", 4], ["h", 8]])
    end

    it "returns correct possible moves for a Rook" do 
      expect(model.get_possible_moves("rook", "d4").sort)
        .to eq([["a", 4], ["b", 4], ["c", 4], ["d", 1], ["d", 2], ["d", 3], ["d", 5], ["d", 6], ["d", 7], ["d", 8], ["e", 4], ["f", 4], ["g", 4], ["h", 4]])
    end

    it "returns correct possible moves for a Knight" do 
      expect(model.get_possible_moves("knight", "d4").sort)
        .to eq([["b", 3], ["b", 5], ["c", 2], ["c", 6], ["e", 2], ["e", 6], ["f", 3], ["f", 5]])
    end

    it "returns correct possible moves for a Bishop" do 
      expect(model.get_possible_moves("bishop", "d4").sort)
        .to eq([["a", 1], ["a", 7], ["b", 2], ["b", 6], ["c", 3], ["c", 5], ["e", 3], ["e", 5], ["f", 2], ["f", 6], ["g", 1], ["g", 7], ["h", 8]])
    end

    it "returns correct possible moves for a White Pawn" do 
      expect(model.get_possible_moves("white pawn", "d4").sort)
        .to eq([["d", 5]])
    end

    it "returns correct possible moves for a Black Pawn" do 
      expect(model.get_possible_moves("black pawn", "d4").sort)
        .to eq([["d", 3]])
    end

  end
end