class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :note, presence: true, length: { maximum: 500 }
end
