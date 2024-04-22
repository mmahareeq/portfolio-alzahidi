Rails.application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "posts#index"

    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
  
    resources :posts do
      member do
        patch :change_status
      end
    end

    namespace :admin do
      resources :users do
        member do
          patch :change_authority
        end
      end
      resources :banners
    end
    get '/switch_locale', to: 'application#switch_locale', as: :switch_locale
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  

  # post '/set_language', to: 'application#set_language', as: :set_language
 

end
