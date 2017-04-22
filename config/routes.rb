Rails.application.routes.draw do
  devise_for :users
  
  scope path:'', module: 'factory', constraints: -> (req) { req.host == 'factory.localhost' } do
    resources :schools, :licenses, :courses, :activities, :experts
    root 'factories#index'
  end 

  namespace :admin do
    resources :schools
  end
  root 'welcome#index'
end
