class RecordsController < ApplicationController

  def index
    board = Board.find(params[:board_id])
    @record = Record.where(board: board).order(created_at: :desc)
  end

  def show

  end

  def new
    @record = Record.new
  end

  def edit
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to board_records_path
    else
      render :new
    end
  end

  def update
    @record = Record.update(record_params)
  end

  def destroy
    @record.destroy
    redirect_to board_records_path
  end

  private
    def set_record
      @record = Record.find(params[:id])
    end

    def record_params
      params.require(:record).permit(:player, :score)
    end
end
