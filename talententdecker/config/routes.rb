Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index' # shortcut for the above
  post '/email', to: 'static#email'
end
