class Photo < ActiveRecord::Base
  belongs_to :album
  
  has_attached_file :photo, :styles => { :original => "1000x1000>", :big => "600x600>", :medium => "200x200>", :thumb => "100x100>" }

end
