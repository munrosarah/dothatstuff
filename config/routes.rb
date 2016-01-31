Rails.application.routes.draw do
  root 'application#index'

  namespace :authentication do
    get 'sign_in', to: :sign_in
  end

  namespace :users do
    get 'new', to: :new
    post 'create', to: :create
  end

  namespace :lists do
    get 'new', to: :new
    get '/:id', to: :show
    post 'create', to: :create
  end
end
