class RemoveProfilePictureFromClient < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :profile_picture, :string
  end
end
