class Record < ActiveRecord::Base
  belongs_to :board
  belongs_to :board_player
end
