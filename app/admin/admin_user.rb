# coding: utf-8
ActiveAdmin.register AdminUser do
  menu :label => "Админ"

  index do
    column 'Ид', :id
    column 'Электронная почта', :email
    column 'Текущий вход в админку', :current_sign_in_at
    column 'Последний вход в админку', :last_sign_in_at
    column 'Количество входов в админку', :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Данные Админа" do
      f.input :email, :label => "Электронная почта"
      f.input :password, :label => "Пароль"
      f.input :password_confirmation, :label => "Повтор пароля"
    end
    f.actions
  end

  show do
    attributes_table do
      row('Ид') { |admin_user| admin_user.id }
      row('Электронная почта') { |admin_user| admin_user.email }
      row('Зашифрованный пароль') { |admin_user| admin_user.password }
      row('Последний вход в админку') { |admin_user| admin_user.last_sign_in_at }
      row('Текущий вход в админку') { |admin_user| admin_user.current_sign_in_at }
      row('Последний ИП') { |admin_user| admin_user.last_sign_in_ip }
      row('Текущий ИП') { |admin_user| admin_user.current_sign_in_ip }
      row('Количество входов в админку') { |admin_user| admin_user.sign_in_count }
      row('Создан') { |admin_user| admin_user.created_at }
      row('Обновлён') { |admin_user| admin_user.updated_at }
    end
    active_admin_comments
  end
end
