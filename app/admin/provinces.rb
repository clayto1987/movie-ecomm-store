ActiveAdmin.register Province do
  batch_action :flag do |selection|
    Province.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Provinces flagged!"
  end

  index do
    selectable_column
    column :id
    column :name
    column :gst
    column :pst
    column :hst
    default_actions
  end
end
