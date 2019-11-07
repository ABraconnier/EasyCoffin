class DeleteUnnecessaryColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :prestations, :done
  end
end
