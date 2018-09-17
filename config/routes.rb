Rails.application.routes.draw do
  get 'admin' => 'admin#index'


  namespace :admin do
    resources :places do
      resources :images, controller: 'place_images'
    end
  end

  # get 'admin' => 'admin/index'

  get 'areas/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "hochiminh/spa/:slug" => "places#show"
  # get ":id" => "places#show"
  resources :places, only: :show

  # get "hochiminh/spa/tes1t" => "places#demo"
  
  # namespace :hochiminh do
    # resources :places, controller: 'places'
  # end
  root 'places#index'
  # resources :places, only: :index
end
