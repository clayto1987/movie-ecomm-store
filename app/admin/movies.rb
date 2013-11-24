ActiveAdmin.register Movie do
  batch_action :flag do |selection|
    Movie.find(selection).each { |p| p.flag! }
    redirect_to collection_path, :notice => "Movies flagged!"
  end

  index do
    selectable_column
    column :id
    column :title
    column :year
    column :rating
    column :runtime
    column :genre
    default_actions
  end
end
