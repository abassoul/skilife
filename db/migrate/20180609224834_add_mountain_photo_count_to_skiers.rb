class AddMountainPhotoCountToSkiers < ActiveRecord::Migration[5.0]
  def change
    add_column :skiers, :mountain_photos_count, :integer
  end
end
