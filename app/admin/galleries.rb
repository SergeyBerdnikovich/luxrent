# coding: utf-8
ActiveAdmin.register Gallery do
  menu :label => "Фото", :priority => 3

  index do
    column 'Ид', :id
    column 'Фото', :photo do |gallery|
      image_tag gallery.photo.url(:small)
    end
    column 'Для фона?', :for_big_slider
    column 'Для слайдера?', :for_small_slider
    column 'Категория', :category
    column 'Сервис', :service
    column 'Русское название', :title
    column 'Английское название', :en_title
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Русский" do
      f.input :title, :label => "Название"
      f.input :description, :label => "Описание"
    end
    f.inputs "Английский" do
      f.input :en_title, :label => "Название"
      f.input :en_description, :label => "Описание"
    end
    f.inputs "Фото", :multipart => true do
      f.input :photo,
              :label => "Фото",
              :as => :file,
              :hint => f.template.image_tag(f.object.photo.url(:normal))
    end
    f.inputs "Другое" do
      f.input :category, :label => "Категория(1 фото для каждой категории)"
      f.input :service, :label => "Сервис"
      f.input :for_big_slider, :label => "Для фона?"
      f.input :for_small_slider, :label => "Для слайдера?"
    end

    f.actions
  end

  show do
    attributes_table do
      row('Ид') { |service| service.id }
      row('Для фона?') { |service| service.for_big_slider }
      row('Для слайдера?') { |service| service.for_small_slider }
      row('Сервис') { |service| service.service }
      row('Категория') { |service| service.category }
      row('Русское название') { |service| service.description }
      row('Русское описание') { |service| service.id }
      row('Английское название') { |service| service.en_title }
      row('Английское описание') { |service| service.en_description }
      row('Путь к файлу') { |service| service.photo }
      row('Создан') { |service| service.created_at }
      row('Обновлён') { |service| service.updated_at }
      row('Фото') do
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
