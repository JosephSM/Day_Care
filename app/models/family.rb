class Family < ActiveRecord::Base
	belongs_to :child
	belongs_to :parent
end