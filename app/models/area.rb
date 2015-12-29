class Area < ActiveRecord::Base
	has_many :services
	has_many :subareas
end
