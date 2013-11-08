class AddImageToMovieproducts < ActiveRecord::Migration
  def change
    add_column :movieproducts, :image_path, :string
  end
end
