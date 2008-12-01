class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :album_id
      t.boolean :best
      t.boolean :main
      t.string :name
      
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
