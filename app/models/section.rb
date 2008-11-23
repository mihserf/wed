class Section < ActiveRecord::Base
  has_many :albums
  
  include SetPermalink
  
end
