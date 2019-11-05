class AddColumnsToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :first_name, :string
    add_column :clients, :last_name, :string
    add_column :clients, :location, :string
    add_column :clients, :profile_picture, :string
    add_column :clients, :account_number, :integer
  end
end
