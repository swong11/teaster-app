class Place < ActiveRecord::Base
	belongs_to :user
	paginates_per 10
end
