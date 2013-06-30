# coding: utf-8
ActiveAdmin.register Price do
  menu :label => "Цены", :priority => 6

  index do
    column 'Ид', :id
    column 'Русское наименование', :title
    column 'Английское наименование', :en_title
    column 'Стоимость', :cost
    column 'Скатегория', :category
    column 'Сервис', :service
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Русский" do
      f.input :title, :label => "Русское наименование"
    end
    f.inputs "Английский" do
      f.input :en_title, :label => "Английское наименование"
    end
    f.inputs "Другое" do
      f.input :cost, :label => "Стоимость"
      f.input :category, :label => "Категория"
      f.input :service, :label => "Сервис"
    end

    f.actions
  end

  show do
    attributes_table do
      row('Ид') { |price| price.id }
      row('Русское наименование') { |price| price.title }
      row('Английское наименование') { |price| price.en_title }
      row('Стоимость') { |price| price.cost }
      row('Категория') { |price| price.category }
      row('Сервис') { |price| price.service }
      row('Создан') { |price| price.created_at }
      row('Обновлён') { |price| price.updated_at }
    end
    active_admin_comments
  end
end