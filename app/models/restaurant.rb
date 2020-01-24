class Restaurant < ApplicationRecord
	validates :name, :phone, presence: true
	validates :name, uniqueness: true
	validates :phone, uniqueness: {case_sensitive: false}

	include Reviewable
end
