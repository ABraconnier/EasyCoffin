class AddLocationToMourners < ActiveRecord::Migration[5.2]
  def change
    add_column :mourners, :location, :string
  end
end
