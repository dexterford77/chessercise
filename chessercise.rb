require_relative 'lib/controller'

class Chessercise

  def initialize
    @controller = Controller.new
  end

  def new_game
    @controller.run
  end

end

chessercise = Chessercise.new
chessercise.new_game
