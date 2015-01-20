class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player, index: true
      t.string     :title,  null: false
      t.integer    :score,  default: 0
      t.integer    :identity, default: 1
      t.integer    :wager,  default: 1

      t.timestamps null: false
    end
  end
end
