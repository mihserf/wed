class Photo < ActiveRecord::Base
  belongs_to :album
  
  has_attachment :thumbnails => {:medium => "120x", :large => "800x600", :preview => "100x100"},
      :croppable_thumbnails => %w(preview), :path_prefix => 'public/assets/images', :autocreate => true
    validates_as_attachment

end
