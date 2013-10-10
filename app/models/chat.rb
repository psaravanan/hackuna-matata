class Chat < ActiveRecord::Base
	attr_accessible :message
	validates_presence_of :message
	validates_length_of :message, :minimum => 10
end
