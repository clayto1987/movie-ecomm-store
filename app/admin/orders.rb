ActiveAdmin.register Order do
  batch_action :flag do |selection|
    Order.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Orders flagged!"
  end

  index do
    selectable_column
    column :id
    column 'Customer' do |order|
      order.customer.first_name + " " + order.customer.last_name
    end
    column :gst_rate
    column :pst_rate
    column :hst_rate
    column :status
    default_actions
  end

  show do |order|
    attributes_table do
      row :id
      row 'Customer' do |order|
        order.customer.first_name + " " + order.customer.last_name
      end
      row :gst_rate
      row :pst_rate
      row :hst_rate
      row :status
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input :customer, :member_label => Proc.new { |t| (t.first_name + " " + t.last_name) }
      f.input :gst_rate
      f.input :pst_rate
      f.input :hst_rate
      f.input :status
    end
    f.actions
  end

end
