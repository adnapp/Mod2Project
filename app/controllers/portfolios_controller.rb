class PortfoliosController < ApplicationController
    before_action :api_client


    def show 

    end

    def new
        @portfolio = Portfolio.new
    end

    def create 
        @portfolio = Portfolio.create(portfolio_params)
    end

    def index
        @key_stats = @client.key_stats('MSFT')
        @company = @client.company('MSFT')
        @news = @client.news('MSFT', 3)
        @quote = @client.quote('MSFT')
    end



    private 

    def portfolio_params
        params.require(:portfolio).permit(:investor_id, :stock_id, :price, :quantity, :buysell)
    end


    private
    def api_client
        @client = IEX::Api::Client.new(
            publishable_token: 'Tpk_28e84a02533f42b19d47d6545f0083c3',
            secret_token: 'secret_token',
            endpoint: 'https://sandbox.iexapis.com/v1'
        )
    end
end
