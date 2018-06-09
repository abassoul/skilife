class AddLocationLatitudeToMountain < ActiveRecord::Migration[5.0]
  def change
    add_column :mountains, :location_latitude, :float
  end
end
