class TripForm
  include ActiveModel::Model

  attr_accessor :note, :user_id

  validates :note, presence: true
  validates :user_id, presence: true

  def save
    return false unless valid?

    trip.save
  end

  private

  def trip
    @trip = Trip.new(
      note: note,
      user_id: user_id
    )
  end
end
