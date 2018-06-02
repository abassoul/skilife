class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :location
      t.string :route_photo
      t.integer :skier_id
      t.string :name

      t.timestamps

    end
  end
end
