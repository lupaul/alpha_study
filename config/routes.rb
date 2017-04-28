Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope path:'', module: 'factory', constraints: -> (req) { req.host == 'factory.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities, :experts, :reservations
    root 'factories#index'
  end

  scope path:'v1', module: 'api/v1', defaults: { format: :json }, constraints: -> (req) { req.host == 'api.justudy.tw' } do
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
          get :create_reservation
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

  resources :reservations do
    member do
      post :check_out
    end
  end

  resources :consultations

  root 'welcome#index'
end
