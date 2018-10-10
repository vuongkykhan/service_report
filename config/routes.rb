Rails.application.routes.draw do
  root 'bugs#index'
  resources :bugs
  resources :custom_fields
end
