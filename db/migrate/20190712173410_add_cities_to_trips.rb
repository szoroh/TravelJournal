class AddCitiesToTrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :city, index: true, foreign_key: true
  end
end
