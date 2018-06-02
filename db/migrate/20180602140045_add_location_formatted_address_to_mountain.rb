class AddLocationFormattedAddressToMountain < ActiveRecord::Migration[5.0]
  def change
    add_column :mountains, :location_formatted_address, :string
  end
end
