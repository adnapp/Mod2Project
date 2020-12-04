Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\
  resources :stocks, except: [:show, :active]
  resources :investors
  resources :portfolios, except: [:new]
  
  get "stocks/new", to: "stocks#new", as: "stock_new"

  get "/stocks/active", to: "stocks#active", as: "stock_active"
  get "/stocks/gainers", to: "stocks#gainers", as: "stock_gainers"
  get "/stocks/losers", to: "stocks#losers", as: "stock_losers"
  get "/stocks/volume", to: "stocks#volume", as: "stock_volume"
  get "/stocks/percent", to: "stocks#percent", as: "stock_percent"
  get "/stocks/:stockticker", to: "stocks#show", as: "stock_show"
  get "/portfolios/new/:ticker", to: "portfolios#new", as: "stock_buy"
  get "/portfolios/filledorders", to: "portfolios#filledorders", as: "stock_filled_orders"

  delete "/sessions/logout", to: 'sessions#logout', as: 'logout'
  get "/sessions/new", to: 'sessions#new', as: 'new_login'
  post '/sessions/login', to: 'sessions#login', as: 'login'

  # get "investors/new", to: "investors#new", as: "investors_new"
end
