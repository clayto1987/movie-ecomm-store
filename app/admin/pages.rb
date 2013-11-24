ActiveAdmin.register Page, :as => "Static Page" do
  config.paginate = false

  controller do
    def base
      @pages = Page.all
    end
    def edit
      @page = Page.find(params[:id])
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :permalink
      f.input :content, :input_html => {:class => 'editor'}
    end
    f.actions
  end
end
