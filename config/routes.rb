require 'api_constraints'

Rails.application.routes.draw do
  
  devise_for :users
  
  namespace :api, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiContraints.new(version: 1, default: true) do
      post 'auth_user', to: 'authentication#authenticate_user'
      
      resources :users, except: [:new, :edit]
      
      resources :spots do
        resources :speed_tests
      end
    end
  end
    
  # Subdomaining Localhost with Rails 5:
  # https://gist.github.com/indiesquidge/b836647f851179589765
  # scope module: 'api' do
  #   namespace :v1 do
  #     resources :spots do
  #       resources :speed_tests  
  #     end
  #   end
  # end
  
end
