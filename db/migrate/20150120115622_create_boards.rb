class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :player,   index: true
      t.string     :title
      t.integer    :wager,    default: 1

      t.timestamps null: false
    end
  end
end
