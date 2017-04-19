Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope path:'', module: 'factory' do
    resources :schools, :licenses, :courses, :activities
    root 'factories#index'
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

  # scope path:'', module: 'factory', constraints: -> (req) { req.host == 'factory.localhost' } do
  #   resources :schools, :licenses, :courses, :activities
  #   root 'factories#index'
  # end

end
