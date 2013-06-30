# coding: utf-8
ActiveAdmin.register Phrase do
  menu :label => "Фразы", :priority => 4

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

    f.actions
  end

  show do
    attributes_table do
      row('Ид') { |phrase| phrase.id }
      row('Русское название') { |phrase| phrase.title }
      row('Русское описание') { |phrase| phrase.description }
      row('Английское название') { |phrase| phrase.en_title }
      row('Английское описание') { |phrase| phrase.en_description }
      row('Создан') { |phrase| phrase.created_at }
      row('Обновлён') { |phrase| phrase.updated_at }
    end
    active_admin_comments
  end
end
