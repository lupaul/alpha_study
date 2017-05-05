Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope path:'', module: 'factory', as: 'factory', constraints: -> (req) { req.host == 'factory.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities, :experts, :reservations
    root 'factories#index'
  end

  scope path:'v1', module: 'api/v1', as: 'v1', defaults: { format: :json }, constraints: -> (req) { req.host == 'api.justudy.tw' } do
    post "login" => "auth#login"
    post "logout" => "auth#logout"
    resources :activities, :reservations, except: [:new, :edit] do
      member do
        post :participate
        post :cancel
      end
    end
    resources :schools, :licenses, :courses, :experts, except: [:new, :edit]
    get 'spec', to: redirect('api_spec.html')
  end

  namespace :admin do
    resources :schools do
      get :consultations, on: :member
      get :account_activity, on: :collection
      get :report, on: :collection
      get :check, on: :collection
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

  resources :consultations

  resources :account, only: :show do
    member do
      get :profile
      get :check_calender
      get :check_liked
    end
  end

  concern :likeable do
      resources :likes do
        collection do
          post :join
          post :del
        end
      end
    end


  resources :activities, :reservations, only: [:index, :show] ,concerns: :likeable do
    member do
      get :participate
      get :cancel
    end
  end

  resources :categories, only: :show
  resources :courses, :licenses, only: :show, concerns: :likeable
  resources :experts, :schools, only: [:index, :show], concerns: :likeable

  root 'welcome#index'
end
