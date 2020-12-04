class PortfoliosController < ApplicationController
    before_action :api_client


    def show #may not need this
       @positions = Portfolio.all
    end

    def new
        @portfolio = Portfolio.new
    end

    def create 
        @current_investor.portfolios << Portfolio.create(portfolio_params)
        # byebug
        # @portfolio = Portfolio.create(portfolio_params)
        redirect_to portfolios_path
    end

    def index
        @live_total = Portfolio.total_portfolio_value.round(2)
        @pp_total = Portfolio.total_portfolio_purchase_price.round(2)
        @percent_change = (100* (@live_total-@pp_total)/@pp_total).round(2)
    end

    def filledorders

    end

    private 

    def portfolio_params
        params.require(:portfolio).permit(:stock_id, :price, :quantity, :buysell)
    end

    def api_client
        @client = IEX::Api::Client.new(
            publishable_token: 'Tpk_28e84a02533f42b19d47d6545f0083c3',
            secret_token: 'secret_token',
            endpoint: 'https://sandbox.iexapis.com/v1'
        )

    end
end
