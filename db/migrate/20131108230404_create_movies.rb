class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :genre
      t.string :rating
      t.integer :runtime
      t.string :title
      t.integer :year

      t.timestamps
    end
  end
end
