class AddColumnsToMourners < ActiveRecord::Migration[5.2]
  def change
    add_column :mourners, :first_name, :string
    add_column :mourners, :last_name, :string
    add_column :mourners, :account_number, :string
    add_column :mourners, :rating, :integer
    add_column :mourners, :age, :integer
    add_column :mourners, :years_of_expertise, :integer
    add_column :mourners, :mourning_intensity, :integer
    add_column :mourners, :price_range, :integer
    add_column :mourners, :profile_picture, :string
  end
end
