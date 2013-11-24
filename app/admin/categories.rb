ActiveAdmin.register Category do
  batch_action :flag do |selection|
    Category.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Categories flagged!"
  end

  index do
    selectable_column
    column :id
    column :name
    default_actions
  end
end
