ActiveAdmin.register Movieproductorder do
  batch_action :flag do |selection|
    Movieproductorder.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Movieproductorders flagged!"
  end

  index do
    selectable_column
    column :movieproduct_id
    column :order_id
    column :price do |product|
      number_to_currency product.price
    end
    column :quantity
    default_actions
  end
end
