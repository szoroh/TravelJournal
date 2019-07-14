class ChangeTemperatureToIntegerInWeather < ActiveRecord::Migration[5.2]
  def change
    change_column :weathers, :temperature, :integer
  end
end
