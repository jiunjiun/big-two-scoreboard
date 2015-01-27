class CreateBoardPlayers < ActiveRecord::Migration
  def change
    create_table :board_players do |t|
      t.references :board,   index: true
      t.references :player,   index: true
      t.string     :anonymous, default: nil
      t.timestamps null: false
    end
  end
end
