Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\
  resources :stocks, except: [:show]
  resources :investors
  resources :portfolios
  get "/stocks/:stockticker", to: "stocks#show", as: "stock_show"
end
