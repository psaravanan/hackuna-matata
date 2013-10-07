class Review < ActiveRecord::Base
	has_many :comments, :as => :commentable
	has_attached_file :photo, :styles => { :small => "150x150#" }
end
