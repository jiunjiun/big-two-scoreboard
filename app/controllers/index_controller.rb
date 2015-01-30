class IndexController < ApplicationController
  def index
    @boards = Board.where({player: current_player}).paginate(:page => params[:page], per_page: 15)
  end
end
