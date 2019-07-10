class CreateTrip < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.text :note, null: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
