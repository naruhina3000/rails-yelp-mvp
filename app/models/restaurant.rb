class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CUISINES = ["Chinese", "Italian", "Japanese", "French", "Belgian"]
  
  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true, inclusion: {in: CUISINES}

  def average_rating
    ratings = self.reviews.pluck(:rating)
    return ratings.sum / ratings.count
  end

end
