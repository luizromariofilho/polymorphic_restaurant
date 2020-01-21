class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true

	validates :comment, :reviewable_type, :reviewable_id, presence: true
end
