class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :weather

  validates :note, presence: true, length: { maximum: 500 }
end
