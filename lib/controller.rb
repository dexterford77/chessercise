require_relative 'model'
require_relative 'view'

class Controller

  def initialize
    @model = Model.new
    @view = View.new
  end

  def run
    piece = @view.get_piece
    location = @view.get_location
    results = @model.get_possible_moves(piece, location)
    p results
    @view.display_results(results, location)
    answer = @view.ask_if_continue
    self.run if answer == "Y"
  end

end
