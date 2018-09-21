Rails.application.routes.draw do
  get 'common_page/index'
  root 'bugs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bugs
  resources :custom_fields
end
