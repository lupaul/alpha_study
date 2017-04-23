Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope path:'', module: 'factory', constraints: -> (req) { req.host == 'factory.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities, :experts
    root 'factories#index'
  end

  scope path:'v1', module: 'api/v1', defaults: { format: :json }, constraints: -> (req) { req.host == 'api.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities, :experts, except: [:new, :edit]
    get 'spec', to: redirect('api_spec.html')
  end

  namespace :admin do
    resources :schools
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

  root 'welcome#index'
end
