# coding: utf-8
ActiveAdmin.register Service do
  menu :label => "Сервисы", :priority => 2

  index do
    column 'Ид', :id
    column 'Русское название', :title
    column 'Русское описание', :description
    column 'Английское название', :en_title
    column 'Английское описание', :en_description
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
    f.inputs "Категории" do
      f.input :categories, as: :check_boxes, :label => "", collection: Category.all
    end
    f.inputs "Цены(если не указать категорию то цена будет для общей категории)" do
      f.has_many :prices do |association|
        if !association.object.nil?
          association.input :_destroy, :as => :boolean, :required => false, :label => "Удалить?"
        end
        association.input :category, :label => "Категория(не обязательно)"
        association.input :title, :label => "Русское наименование"
        association.input :en_title, :label => "Английское наименование"
        association.input :cost, :label => "Цена"
      end
    end
    # f.inputs "Фото" do
    #   f.has_many :galleries do |association|
    #     if !association.object.nil?
    #       association.input :_destroy, :as => :boolean, :required => false, :label => "Удалить?"
    #     end
    #     association.input :photo,
    #                       :label => "Фото",
    #                       :as => :file,
    #                       :hint => (f.template.image_tag(association.object.photo.url(:block2)))
    #   end
    # end
    f.actions
  end

  show do
    attributes_table do
      row('Ид') { |service| service.id }
      row('Русское название') { |service| service.title }
      row('Русское описание') { |service| service.description }
      row('Английское название') { |service| service.en_title }
      row('Английское описание') { |service| service.en_description }
      row('Создан') { |service| service.created_at }
      row('Обновлён') { |service| service.updated_at }
      row('Категории') do |service|
        service.categories.each do |category|
          ul
            li link_to category.title, admin_category_path(category)
        end
      end
      row('Цены(обшие)') do |service|
        render partial: "layouts/prices", locals: { :service_id => service.id, :category_id => nil }
      end
      row('Цены(по категориям)') do |service|
        service.categories.each do |category|
          if Price.where(:service_id => service.id, :category_id => category.id).first
            h3 category.title
            render partial: "layouts/prices", locals: { :service_id => service.id, :category_id => category.id }
          else
            h3 nil
          end
        end
      end
      row('Фото') do |service|
        service.galleries.each do |gallery|
          span link_to image_tag(gallery.photo.url(:block2)), gallery.photo.url, :class => 'lightbox_trigger'
        end
      end
    end
    active_admin_comments
  end
end
