Rails.application.routes.draw do
  root 'urls#dashboard'

  get '/:long_url', to: 'urls#redirect_to_long_url'
end
