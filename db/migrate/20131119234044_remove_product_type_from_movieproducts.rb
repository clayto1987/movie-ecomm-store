class RemoveProductTypeFromMovieproducts < ActiveRecord::Migration
  def up
    remove_column :movieproducts, :product_type
  end

  def down
    add_column :movieproducts, :product_type, :string
  end
end
