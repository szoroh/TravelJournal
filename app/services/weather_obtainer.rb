class WeatherObtainer

  def initialize(city_name)
    @name = city_name
  end

  def call
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{@name}&appid=#{Rails.application.credentials[:APPID]}")
    return nil if response.parsed_response&.dig('cod') == '404'
    (response['main']['temp'] - 272.15).round
  end
end
