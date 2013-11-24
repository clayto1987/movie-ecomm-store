ActiveAdmin.register Movieproduct do
  batch_action :flag do |selection|
    Movieproduct.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Movieproducts flagged!"
  end

  index do
    selectable_column
    column :id
    column 'Image' do |image|
      image_tag image.image_path, :size => '30x40'
    end
    column :category, :sortable => 'category.name'
    column :description
    column :price, :sortable => :price do |product|
      number_to_currency product.price
    end
    column :stock_quantity
    default_actions
  end
end
