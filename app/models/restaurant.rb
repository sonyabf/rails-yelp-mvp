class Restaurant < ApplicationRecord

  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY, message: "must be a valid category" }
end
