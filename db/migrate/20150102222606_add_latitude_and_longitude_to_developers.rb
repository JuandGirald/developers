class AddLatitudeAndLongitudeToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :latitude, :float
    add_column :developers, :longitude, :float
  end
end
