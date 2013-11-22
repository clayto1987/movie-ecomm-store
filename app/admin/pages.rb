ActiveAdmin.register Page do
  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :permalink
      f.input :content, :input_html => {:class => 'static_textarea'}
    end
    f.actions
  end
end
