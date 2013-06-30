# coding: utf-8
ActiveAdmin.register Setting do
  menu :label => "Элементы страницы", :priority => 5

  index do
    column 'Ид', :id
    column 'Название элемента', :title
    column 'Русское содержание элемента', :content
    column 'Английское содержание элемента', :en_content
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
    f.inputs "#{f.object.title}" do
      #f.input :title, :label => f.object.title
    end
    f.inputs "Русский" do
      f.input :content, :label => "Содержание"
    end
    f.inputs "Английский" do
      f.input :en_content, :label => "Содержание"
    end

    f.actions
  end

  show do
    attributes_table do
      row('Ид') { |setting| setting.id }
      row('Название элемента') { |setting| setting.title }
      row('Русское содержание элемента') { |setting| setting.content }
      row('Английское содержание элемента') { |setting| setting.en_content }
      row('Создан') { |setting| setting.created_at }
      row('Обновлён') { |setting| setting.updated_at }
    end
    active_admin_comments
  end
end