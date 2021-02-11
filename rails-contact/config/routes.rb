Rails.application.routes.draw do
  resources :contacts
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    :registrations => 'users/registrations'
  }
  root :to => 'welcome#index'
  get 'test', :to=> 'welcome#test'
end
