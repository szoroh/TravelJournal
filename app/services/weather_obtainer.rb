class WeatherObtainer
  def initialize(city_name)
    @name = city_name
  end

  def call
    # city name is assigned to instance variable in initialize and used in response to create
    # a request and further parse obtained hash and take from it temperature parameter. It is
    # further recalculated to Celsius degrees.

    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{@name}&appid=#{Rails.application.credentials[:APPID]}")
    return unless response.parsed_response&.dig('cod') == 200
    (response['main']['temp'] - 272.15).round
  end
end
