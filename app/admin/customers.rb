ActiveAdmin.register Customer do
  batch_action :flag do |selection|
    Customer.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Customers flagged!"
  end

  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :address
    column :city
    column :province, :sortable => 'province.name'
    column :country
    column :postal_code
    column :email
    default_actions
  end
end
