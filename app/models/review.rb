class Review < ApplicationRecord
  validates :review, :user_name, presence: true

  belongs_to :product

end
