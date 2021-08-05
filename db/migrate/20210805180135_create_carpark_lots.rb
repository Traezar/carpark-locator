class CreateCarparkLots < ActiveRecord::Migration[6.1]
  def change
    create_table :carpark_lots do |t|
      t.integer :total_lots
      t.integer :lots_available
      t.timestamps

      t.belongs_to :carpark
    end
  end
end
