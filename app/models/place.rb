class Place < ActiveRecord::Base
	self.per_page = 10
	
	belongs_to :user
	validates :name, :presence => true, :length => {:minimum => 3}
	validates :address, :presence => true
	validates :description, :presence => true, :length => {:maximum => 140, :minimum => 3}
end

