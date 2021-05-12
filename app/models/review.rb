class Review < ApplicationRecord
  belongs_to :restaurant

  STARS = [0, 1, 2, 3, 4, 5]

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
