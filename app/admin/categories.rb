# coding: utf-8
ActiveAdmin.register Category do
  menu :label => "Категории", :priority => 1

  index do
    column 'Ид', :id
    column 'Русское название', :title
    column 'Русское описание', :description
    column 'Английское название', :en_title
    column 'Английское описание', :en_description
    column 'Отдельный блок?', :separately
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
    f.inputs "Дополнительно" do
      f.input :separately, :label => "В отдельном блоке?"
      f.has_many :galleries do |association|
        if !association.object.nil?
          association.input :_destroy, :as => :boolean, :required => false, :label => "Удалить?"
        end
        association.input :photo,
                          :label => "Фото для блока 1 (не более 1 штуки)",
                          :as => :file,
                          :hint => (f.object.galleries.first ? f.template.image_tag(f.object.galleries.first.photo.url(:block2)) : nil)
      end
    end

    f.actions
  end

  show do
    attributes_table do
      row('Ид') { |category| category.id }
      row('Русское название') { |category| category.title }
      row('Русское описание') { |category| category.description }
      row('Английское название') { |category| category.en_title }
      row('Английское описание') { |category| category.en_description }
      row('Отдельный блок?') { |category| category.separately }
      row('Создан') { |category| category.created_at }
      row('Обновлён') { |category| category.updated_at }
      row('Фото для блока 1') do |category|
        div image_tag category.galleries.first.photo.url(:block2) if category.galleries.first
      end
      row('Сервисы') do |category|
        category.services.each do |service|
          ul
            li link_to service.title, admin_service_path(service)
        end
      end
    end
    active_admin_comments
  end
end
