Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "hochiminh/spa/test" => "places#show"

  root 'places#index'
  # resources :places, only: :index
end
