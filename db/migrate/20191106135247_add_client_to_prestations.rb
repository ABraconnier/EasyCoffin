class AddClientToPrestations < ActiveRecord::Migration[5.2]
  def change
    add_reference :prestations, :client, foreign_key: true
  end
end
