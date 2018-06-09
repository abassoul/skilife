class ChangeAvalancheDangerDefaultValueInMountains < ActiveRecord::Migration[5.0]
  def change
    change_column_default :mountains, :avalanche_danger, '0'
  end
end
