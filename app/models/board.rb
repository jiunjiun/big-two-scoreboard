class Board < ActiveRecord::Base
  belongs_to :player
  has_many   :records
  has_many   :board_players

  def save_of_user(current_player)
    self.player = current_player
    save
  end
end
