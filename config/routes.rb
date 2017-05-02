Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope path:'', module: 'factory', as: 'factory', constraints: -> (req) { req.host == 'factory.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities, :experts, :reservations
    root 'factories#index'
  end

  scope path:'v1', module: 'api/v1', as: 'v1', defaults: { format: :json }, constraints: -> (req) { req.host == 'api.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities, :experts, :reservations, except: [:new, :edit]
    get 'spec', to: redirect('api_spec.html')
  end

  namespace :admin do
    resources :schools do
      get :account_activity, on: :collection
      resources :reservations, :activities
    end
    resources :rootusers
  end

  namespace :crm do
    resources :users do
      member do
        delete :delete
      end
    end
  end

  resources :enrollments do
    member do
      post :be_partner
    end
  end

  resources :activities, only: [:index, :show] do
    member do
      get :participate
    end 
  end

  resources :categories,:courses, :licenses, only: :show
  resources :experts, :reservations, :schools, only: [:index, :show]

  root 'welcome#index'
end
