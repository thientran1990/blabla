Rails.application.routes.draw do
  get 'admin' => 'admin#index'


  namespace :admin do
    resources :places, except: :index do
      get :change_image  
      resources :images, controller: 'place_images'
    end
  end


  # get 'areas/index'
  resources :places, only: :show

  root 'places#index'
end
