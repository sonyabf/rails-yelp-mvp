class Review < ApplicationRecord
  AUTHORIZED_RATINGS = (1..5)

  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: AUTHORIZED_RATINGS }

end
