class PortfoliosController < ApplicationController
    before_action :api_client


    def show 
       
    end

    def new
        @portfolio = Portfolio.new
    end

    def create 
        byebug
        @portfolio = Portfolio.create(portfolio_params)
        redirect_to portfolios_path
    end

    def index
        @portfolio = Portfolio.all
        # @positions = Portfolio.all
        # @total = 0
        # @newhash = {}
        # @positions.each do |t|
        #     if t.buysell #if stock is bought, this boolean is true
        #         @p = t[:quantity] * t[:price]
        #         @total += @p
        #     else
        #         @p = t[:quantity] * t[:price] 
        #         @total -= @p
        #     end

        # end 
        # @total
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
