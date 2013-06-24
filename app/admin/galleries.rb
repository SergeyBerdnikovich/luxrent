ActiveAdmin.register Gallery do
  index do
    column :id
    column :photo do |gallery|
      image_tag gallery.photo.url(:small)
    end
    column :for_big_slider
    column :for_small_slider
    column :category
    column :service
    column :photo
    column :created_at
    column :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Category" do
      f.input :category
    end
    f.inputs "Service" do
      f.input :service
    end
    f.inputs "Photo", :multipart => true do
      f.input :photo, :as => :file, :hint => f.template.image_tag(f.object.photo.url(:normal))
      f.input :for_big_slider
      f.input :for_small_slider
    end

    f.actions
  end

  show do
    attributes_table do
      row :id
      row :service
      row :for_big_slider
      row :for_small_slider
      row :category
      row :service
      row :photo
      row :created_at
      row :updated_at
      row :photo do
        image_tag gallery.photo.url(:normal)
      end
    end
    active_admin_comments
  end

  controller do
    def create
      @gallery = Gallery.new(params[:gallery])
      if @gallery.save
        if params[:gallery][:photo].present?
          render :crop
        else
          redirect_to admin_gallery_path(@gallery), :notice => "Succcessfully created gallery."
        end
      else
        render :new
      end
    end
    def update
      @gallery = Gallery.find(params[:id])
      if @gallery.update_attributes(params[:gallery])
        if params[:gallery][:photo].present?
          render :crop
        else
          redirect_to admin_gallery_path(@gallery), :notice => "Succcessfully updated gallery."
        end
      else
        render :edit
      end
    end
  end
end
