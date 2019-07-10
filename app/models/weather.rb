class Weather < ApplicationRecord
  validates :weather, presence: true
end
