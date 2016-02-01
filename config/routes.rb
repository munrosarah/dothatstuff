Rails.application.routes.draw do
  root 'application#index'

  get    'sign_in', to: 'sessions#new'
  post   'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  namespace :users do
    get 'new', to: :new
    post 'create', to: :create
    get '/:id/list', to: :list, as: :list
  end

  namespace :lists do
    get 'new', to: :new
    get '/:id', to: :show
    post 'create', to: :create
  end

  namespace :list_items do
    post 'create', to: :create
    post '/:id/toggle_completed', to: :toggle_completed
  end
end
