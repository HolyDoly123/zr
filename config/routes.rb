Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
      resources :room_messages
      resources :rooms
      devise_for :users
      root controller: :rooms, action: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
