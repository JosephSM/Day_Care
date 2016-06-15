class Teacher < ActiveRecord::Base
	has_one :group
	belongs_to :center

	has_secure_password
    validates_confirmation_of :password
	validates_presence_of :password, on: :create
end