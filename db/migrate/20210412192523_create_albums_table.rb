class CreateAlbumsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do | t |
      t.string :title
      t.string :artist
      t.integer :year
      t.string :condition
      t.boolean :reissue
      t.string :tracklist
      t.string :label
      t.string :producer
      
      t.timestamps
    end 
  end
end
