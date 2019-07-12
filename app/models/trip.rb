class Trip < ApplicationRecord
  belongs_to :user

  validates :note, presence: true, length: { maximum: 500 }
end
