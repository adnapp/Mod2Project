class PortfoliosController < ApplicationController
    skip_before_action :authorized
    before_action :api_client


    def show #may not need this
       
    end

    def new
        @portfolio = Portfolio.new
    end

    def create 
        @portfolio = Portfolio.create(portfolio_params)
        redirect_to portfolios_path
    end

    def index
   
    end

    private 

    def portfolio_params
        params.require(:portfolio).permit(:investor_id, :stock_id, :price, :quantity, :buysell)
    end

    def api_client
        @client = IEX::Api::Client.new(
            publishable_token: 'Tpk_28e84a02533f42b19d47d6545f0083c3',
            secret_token: 'secret_token',
            endpoint: 'https://sandbox.iexapis.com/v1'
        )
    end
end
