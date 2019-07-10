class CreateWeather < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.float :temperature

      t.timestamps
    end
  end
end
