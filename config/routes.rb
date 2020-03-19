Rails.application.routes.draw do
  get '/shelters', to: 'shelters#index'
  get '/shelters/:id', to: "shelters#show"
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
end
