Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



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


  # namespace :factory do
  #   constraints subdomain: 'factory' do
  #     resources :schools, :licenses, :courses, :activities
  #     root 'factories#index'
  #   end
  # end

  # scope path:'', module: 'factory', constraints subdomain: "factory" do
  #   root 'factories#index'
  #   resources :schools, :licenses, :courses, :activities
  # end




  scope path:'', module: 'factory', constraints: -> (req) { req.host == 'factory.justudy.tw' } do
    resources :schools, :licenses, :courses, :activities
    root 'factories#index'
  end
  root 'welcome#index'
end
