ActiveAdmin.register Movieproduct do
  batch_action :flag do |selection|
    Post.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Posts flagged!"
  end

  index do
    selectable_column
    column 'Image' do |image|
      image_tag image.image_path, :size => '30x40'
    end
    column :product_type
    column :description
    column :price
    column :stock_quantity
    default_actions
  end
end
