Luxrent::Application.routes.draw do
  scope "(:locale)", :locale => /en|ru/ do
    root :to => 'pages#welcome'
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
