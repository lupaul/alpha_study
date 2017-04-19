Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope path:'', module: 'factory', constraints: -> (req) { req.host == 'factory.localhost' } do
    resources :schools, :licenses, :courses, :activities
    root 'factories#index'
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
  
  namespace :admin do
    resources :schools
  end
  root 'welcome#index'
end
