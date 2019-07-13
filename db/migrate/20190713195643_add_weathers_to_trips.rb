class AddWeathersToTrips < ActiveRecord::Migration[5.2]
  def change
    add_reference :trips, :weather, index: true, foreign_key: true
  end
end
