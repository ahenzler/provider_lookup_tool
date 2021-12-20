Rails.application.routes.draw do

get '/', to: 'application#welcome'

  namespace :api do
    namespace :v1 do
      get '/search', to: 'provider#search'
      get '/results', to: 'provider#results'
    end
  end
end
