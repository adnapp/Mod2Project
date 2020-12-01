class PortfoliosController < ApplicationController

    def show 

    end

    def index
        @client = IEX::Api::Client.new(
        publishable_token: 'Tpk_28e84a02533f42b19d47d6545f0083c3',
        secret_token: 'secret_token',
        endpoint: 'https://sandbox.iexapis.com/v1'
    )
        @key_stats = @client.key_stats('MSFT')
        @company = @client.company('MSFT')
        @news = @client.news('MSFT', 3)
        @quote = @client.quote('MSFT')
    end

end
