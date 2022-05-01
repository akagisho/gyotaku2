Rails.application.routes.draw do
  resources :folders do
    get 'add_urls', to: 'folders#add_urls'
    post 'add_urls', to: 'folders#add_urls'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
