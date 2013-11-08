class CreateMovieproducts < ActiveRecord::Migration
  def change
    create_table :movieproducts do |t|
      t.string :description
      t.integer :movie_id
      t.decimal :price
      t.string :product_type
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
