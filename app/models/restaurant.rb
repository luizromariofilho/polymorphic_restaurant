class Restaurant < ApplicationRecord
	validates :name, :phone, presence: true
	validates :name, :phone, uniqueness: true

	include Reviewable
end
