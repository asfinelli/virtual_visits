Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :doctors
  resources :users

  resources :sessions
  resources :doctors_sessions
  resources :appointments
  resources :charges
  resources :virtual_visits

  resources :pages, only: [] do
    collection do
      get :faq
      get :contact
    end
  end
  # get "/pages/:page" => "pages#show"
  # get "pages/FAQ" => "pages#FAQ"
  # get "pages/contact" =>"pages#contact"
end
