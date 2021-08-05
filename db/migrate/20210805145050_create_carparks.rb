# frozen_string_literal: true

class CreateCarparks < ActiveRecord::Migration[6.1]
  def change
    create_table :carparks do |t|
      t.string :short_term_parking
      t.string :carpark_type
      t.string :y_coord
      t.string :x_coord
      t.string :address
      t.string :carpark_decks
      t.string :source_id
      t.string :carpark_no
      t.string :type_of_parking_system
      t.float :gantry_height
      t.boolean :free_parking
      t.boolean :night_parking
      t.boolean :carpark_basement
      t.timestamps
    end

    add_index :carparks, [:source_id, :carpark_no], :unique => true
  end
end
