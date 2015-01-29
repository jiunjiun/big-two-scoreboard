class BoardPlayer < ActiveRecord::Base
  belongs_to :board
  belongs_to :player
  has_many :records

  def save_of_board(board_id)
    self.board_id = board_id
    self.anonymous = nil if self.player_id
    save
  end
end
