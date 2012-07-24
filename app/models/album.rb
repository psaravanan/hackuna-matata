class Album < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "150x150#" }
end
