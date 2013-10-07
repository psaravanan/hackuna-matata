class Album < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "150x150#", :medium => "50x55" }
end
