class IndexController < ApplicationController
  def index
    @boards = Board.where({player: current_player})
  end
end
