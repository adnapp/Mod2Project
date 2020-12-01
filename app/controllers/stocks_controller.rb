class StocksController < ApplicationController
    before_action :api_client

    def index
        # goes to api, show top 50 stock. 
        #clicking brings you to show page (also ability to buy?)-- by sending unique info
        #dropdown of client.stock_market_list(:mostactive) -- GET LIST. see what options we have
        #

        @stocks = @client.stock_market_list(:mostactive)

    end

    def show  #shows individual stocks   
        @key_stats = @client.key_stats(params[:stockticker])
        @company = @client.company(params[:stockticker])
        @news = @client.news(params[:stockticker], 3)
        @quote = @client.quote(params[:stockticker])
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
