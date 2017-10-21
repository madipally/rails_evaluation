class List < ApplicationRecord

  validates :name,:description, presence: true
  validates :description, length: { minimum: 5 }
  has_many :items, -> { order "name"}         
end
