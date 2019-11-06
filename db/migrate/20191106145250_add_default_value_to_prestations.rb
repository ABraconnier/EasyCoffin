class AddDefaultValueToPrestations < ActiveRecord::Migration[5.2]
  def change
    change_column :prestations, :status, :integer, :default => 0
  end
end
