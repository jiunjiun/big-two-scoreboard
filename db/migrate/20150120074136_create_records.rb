class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :game, index: true
      t.integer    :score, default: 0

      t.timestamps null: false
    end
  end
end
