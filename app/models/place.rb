class Place < ActiveRecord::Base
	belongs_to :user
	paginates_per 2
end
