Rails.application.routes.draw do

  devise_for :admin_users, Cardboard::Devise.config
  mount Cardboard::Engine => "/cardboard"
end
