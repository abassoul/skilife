class AddLocationLongitudeToMountain < ActiveRecord::Migration[5.0]
  def change
    add_column :mountains, :location_longitude, :float
  end
end
