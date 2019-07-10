class Trip < ApplicationRecord
  belongs_to :user

  validates :note, presence: true
end
