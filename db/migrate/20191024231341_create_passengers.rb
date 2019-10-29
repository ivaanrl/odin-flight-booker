class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email

      t.references :flight, foreign_key: true
      t.references :booking, foreign_key: true
      
      t.timestamps
    end
  end
end
