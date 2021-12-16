Rails.application.routes.draw do

get '/', to: 'application#welcome'

get '/search', to: 'application#search'
get '/results', to: 'application#show'
end
