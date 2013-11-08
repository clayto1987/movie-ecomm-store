class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :address
      t.string :city
      t.string :country
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :postal_code
      t.integer :province_id

      t.timestamps
    end
  end
end
