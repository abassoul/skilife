class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :location
      t.integer :skier_id
      t.string :name
      t.integer :avalanche_danger

      t.timestamps

    end
  end
end
