Rails.application.routes.draw do
  devise_for :users
  get '/urls' => 'urls#index'
  get '/:short_url' => 'urls#redirect'
  root :to => "urls#index"
  resources :urls
end




