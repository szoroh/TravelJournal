class Weather < ApplicationRecord
  has_many :trips

  validates :weather, presence: true
end
