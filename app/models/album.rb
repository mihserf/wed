class Album < ActiveRecord::Base
  belongs_to :album
  has_many :photos
  
  include SetPermalink
  
end
