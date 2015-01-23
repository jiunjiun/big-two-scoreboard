class BoardsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_board, only: [:edit, :update, :destroy]

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    if @board.save_with_user(current_player)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to root_path
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:master, :title, :wager)
    end
end
