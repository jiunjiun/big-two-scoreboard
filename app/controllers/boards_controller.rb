class BoardsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_board, only: [:edit, :update, :destroy]

  def new
    @board = Board.new
  end

  def show
    board    = Board.find(params[:id])
    @bps     = BoardPlayer.where(board: board)
    @records = Record.where(board: board).order(created_at: :desc)
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    if @board.save_of_user(current_player)
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

  def players
    board   = Board.find(params[:id])
    @new_bp = BoardPlayer.new({board: board})
    @bps    = BoardPlayer.where({board: board})
  end

  def search_player
    @players = Player.where('name like ?', "#{params[:name]}%")
  end

  def create_player
    bp = BoardPlayer.new(board_player_params)
    redirect_to players_board_path if bp.save_of_board(params[:id])
  end

  def destroy_player
    BoardPlayer.find(params[:bp_id]).delete
    redirect_to players_board_path
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:master, :title, :wager)
    end

    def board_player_params
      params.require(:board_player).permit(:board_id, :player_id, :anonymous)
    end
end
