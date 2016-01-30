Rails.application.routes.draw do
  root 'application#index'

  namespace :authentication do
    get 'sign_in', to: :sign_in
  end
end
