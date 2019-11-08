class AddCoordinatesToMourners < ActiveRecord::Migration[5.2]
  def change
    add_column :mourners, :latitude, :float
    add_column :mourners, :longitude, :float
  end
end
