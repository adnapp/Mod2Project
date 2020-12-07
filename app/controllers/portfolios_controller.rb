class PortfoliosController < ApplicationController
    before_action :api_client
    before_action :unique_tickers
    before_action :find_portfolio, only: [:edit, :update]

    def new
        @portfolio = Portfolio.new
    end

    def create 
        #look up stock, returns nill if not in db
        stock = Stock.all.find  {|stock| stock.ticker == params[:portfolio][:ticker]}

        if !stock   #if not in db, set params 
            stock = Stock.create(ticker: params[:portfolio][:ticker])
        end

        #need to add stock id to params
        params[:portfolio][:stock_id] = stock.id

        #then we create the portfolio
        @current_investor.portfolios << Portfolio.create(portfolio_params)
        # @portfolio = Portfolio.create(portfolio_params)
        redirect_to portfolios_path
    end

    def index
        @live_total = Portfolio.total_portfolio_value.round(2)
        @pp_total = Portfolio.total_portfolio_purchase_price
        @percent_change =  100 *(@live_total-@pp_total)/@pp_total
        @balance = Portfolio.cash
    end

    def show 
        @live_total = Portfolio.total_portfolio_value.round(2)
        @pp_total = Portfolio.total_portfolio_purchase_price
        @percent_change =  100 *(@live_total-@pp_total)/@pp_total
        @balance = Portfolio.cash
        @positions = Portfolio.all
        # @portfolio = Portfolio.find(params[:id])
        # @investor = Investor.find(params[:id])
    #          if @investor == @current_investor
    #     render :show
    #   else
    #      redirect_to new_investor_path 
    #   end 
    end 

    def filledorders
        @positions = Portfolio.all
    end

    def sell
        @portfolio = Portfolio.new
        @positions = Portfolio.all
    end

    def edit 
        # @portfolio = Portfolio.find(params[:id]) replacing
    end 

    def update 
        # portfolio = Portfolio.find(params[:id]) replacing
        @portfolio.update(portfolio_params)
        redirect_to portfolios_path 
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

    def find_portfolio
        @portfolio = Portfolio.find(params[:id])
    end

    def unique_tickers
        @unique = Portfolio.unique_tickers
    end
end
