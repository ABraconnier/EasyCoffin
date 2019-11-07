class AddPhotoToMourners < ActiveRecord::Migration[5.2]
  def change
    add_column :mourners, :photo, :string
  end
end
