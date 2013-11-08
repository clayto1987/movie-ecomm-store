class CreateMovieproductorders < ActiveRecord::Migration
  def change
    create_table :movieproductorders do |t|
      t.integer :movieproduct_id
      t.integer :order_id
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
