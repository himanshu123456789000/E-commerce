class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :pincode
      t.string :city
      t.string :state
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
