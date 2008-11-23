class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :section_id
      t.string :name
      t.text :description
      t.string :permalink
      
      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
