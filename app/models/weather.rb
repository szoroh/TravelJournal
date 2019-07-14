class Weather < ApplicationRecord
  has_many :trips

  validates :temperature, presence: true
end
