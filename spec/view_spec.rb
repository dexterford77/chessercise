require 'view'

describe View do

  let(:view) { View.new }

  describe "#get_piece" do

    it "accepts valid user input" do
      allow_any_instance_of(Object).to receive(:gets).and_return("King")
      expect(view.get_piece).to eq("king")
    end

  end

  describe "#get_location" do

    it "accepts valid user input" do
      allow_any_instance_of(Object).to receive(:gets).and_return("A1")
      expect(view.get_location).to eq("a1")
    end

  end

end