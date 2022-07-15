Rails.application.routes.draw do
  devise_for :users
  get '/urls' => 'urls#index'
  get '/:short_url' => 'urls#redirect'
  root :to => "urls#index"
  resources :urls

  namespace :api do
    resources :regions, :provinces, only: :index, defaults: { format: :json }
  end
end




