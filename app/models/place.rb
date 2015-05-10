class Place < ActiveRecord::Base
	belongs_to :user
	validates :name, :presence => true
	paginates_per 10
end
