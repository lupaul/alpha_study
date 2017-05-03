Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope path:'', module: 'factory', as: 'factory', constraints: -> (req) { req.host == 'factory.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities, :experts, :reservations
    root 'factories#index'
  end

  scope path:'v1', module: 'api/v1', as: 'v1', defaults: { format: :json }, constraints: -> (req) { req.host == 'api.justudy.tw' } do
    post "login" => "auth#login"
    post "logout" => "auth#logout"
    resources :schools, :licenses, :courses, :activities, :experts, :reservations, except: [:new, :edit]
    get 'spec', to: redirect('api_spec.html')
  end

  namespace :admin do
    resources :schools do
      get :consultations, on: :member
      get :account_activity, on: :collection
      resources :activities
      resources :reservations do
        collection do
          post :checkout
          post :join
        end
      end
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

  resources :account, only: :show do
    member do
      get :profile
      get :check_calender
      get :check_liked
    end
  end

  resources :activities, :reservations, only: [:index, :show] do
    member do
      get :participate
      get :cancel
    end 
  end

  resources :categories,:courses, :licenses, only: :show
  resources :experts, :schools, only: [:index, :show]
  resources :consultations, only: [:new, :create]

  root 'welcome#index'
end
