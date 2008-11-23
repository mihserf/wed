class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :album_id
      t.boolean :best
      t.boolean :main
      t.string :name
      t.string :filename
      t.string :content_type
      t.integer :width
      t.integer :height
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
