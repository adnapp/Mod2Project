Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html\
  resources :stocks, except: [:show, :active]
  resources :investors
  resources :portfolios
  get "/stocks/active", to: "stocks#active", as: "stock_active"
  get "/stocks/gainers", to: "stocks#gainers", as: "stock_gainers"
  get "/stocks/losers", to: "stocks#losers", as: "stock_losers"
  get "/stocks/volume", to: "stocks#volume", as: "stock_volume"
  get "/stocks/percent", to: "stocks#percent", as: "stock_percent"
  get "/stocks/:stockticker", to: "stocks#show", as: "stock_show"
end
