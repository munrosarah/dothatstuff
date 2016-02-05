Rails.application.routes.draw do
  root 'application#index'

  get    'login', to: 'sessions#new'
  post   'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  namespace :users do
    get 'new', action: :new
    post 'create', action: :create
    get '/:id/list', action: :list, as: :list
  end

  namespace :lists do
    get 'new', action: :new
    get '/:id', action: :show
    post 'create', action: :create
    post '/:id/toggle_hidden', action: :toggle_hidden
  end

  namespace :list_items do
    post 'create', to: :create
    post '/:id/toggle_completed', action: :toggle_completed
  end
end
