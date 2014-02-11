Rails.application.routes.draw do

  devise_for :admin_users
  mount Cardboard::Engine => "/cardboard"
end
