class CreatePrestations < ActiveRecord::Migration[5.2]
  def change
    create_table :prestations do |t|
      t.text :review
      t.string :location
      t.date :date
      t.integer :price
      t.references :mourner, foreign_key: true
      t.references :client, foreign_key: true
      t.integer :status
      t.integer :intensity

      t.timestamps
    end
  end
end
