class TripForm
  include ActiveModel::Model

  attr_accessor :note, :user_id, :city_name

  validates :note, presence: true
  validates :user_id, presence: true
  validates :city_name, presence: true

  def save
    return false unless valid?

    trip.save
  end

  private

  def trip
    @trip = Trip.new(
      note: note,
      user_id: user_id,
      city: city
    )
  end

  def city
    @city = City.find_or_create_by(name: city_name)
  end
end
