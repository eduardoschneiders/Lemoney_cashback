Rails.application.routes.draw do
  devise_for :clients, controllers: {
           sessions: 'clients/sessions',
           registrations: 'clients/registrations' }
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "home#index"

  get '/rewards' => 'rewards#index'
  match '/redirect_to_offer/:offer_id' => 'redirect_to_offer#redirect', as: 'redirect_to_offer', via: [:get, :post]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
