class Board < ActiveRecord::Base
  belongs_to :player
  has_many   :records

  def save_with_user(current_player)
    self.player = current_player
    save
  end
end
