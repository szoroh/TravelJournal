class TripForm
  include ActiveModel::Model

  attr_accessor :note, :user_id, :city_name, :temperature

  validates :note, presence: true
  validates :user_id, presence: true
  validates :city_name, presence: true
  validates :temperature, presence: true

  def save
    return false unless valid?

    trip.save
  end

  private

  def trip
    @trip = Trip.new(
      note: note,
      user_id: user_id,
      city: city,
      weather: weather
    )
  end

  def city
    @city = City.find_or_create_by(name: city_name)
  end

  def weather
    @weather = Weather.find_or_create_by(temperature: temperature)
  end
end

# Trip Form was necessary in order to avoid nested attributes - it creates an abstraction
# layer which simplifies creation of 3 separate records with single request by use of simple_form_for
# on just one instance variable.
