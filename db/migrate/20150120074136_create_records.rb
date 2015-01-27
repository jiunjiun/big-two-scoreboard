class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :board,  index: true
      t.references :player, index: true
      t.integer    :score,  default: 0

      t.timestamps null: false
    end
  end
end
