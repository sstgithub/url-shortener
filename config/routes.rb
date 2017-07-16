Rails.application.routes.draw do
  # root 'urls#dashboard'

  resources :urls, except: [:index, :edit, :update, :destroy]
  root 'urls#new'
  get '/:short_url', to: 'urls#redirect_to_long_url'
end
