class Item < ApplicationRecord
  validates :name, presence: true    
  belongs_to :list
  has_and_belongs_to_many :tags
end
