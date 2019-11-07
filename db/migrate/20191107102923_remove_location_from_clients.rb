class RemoveLocationFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :location
  end
end
