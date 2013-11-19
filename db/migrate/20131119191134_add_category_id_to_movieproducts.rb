class AddCategoryIdToMovieproducts < ActiveRecord::Migration
  def change
    add_column :movieproducts, :category_id, :integer
  end
end
