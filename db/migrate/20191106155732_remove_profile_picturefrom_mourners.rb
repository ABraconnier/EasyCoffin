class RemoveProfilePicturefromMourners < ActiveRecord::Migration[5.2]
  def change
    remove_column :mourners, :profile_picture
  end
end
