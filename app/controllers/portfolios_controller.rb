class PortfoliosController < ApplicationController
    before_action :api_client
    before_action :unique_tickers
    before_action :find_portfolio, only: [:edit, :update]
    before_action :portfolio_vars, only: [:index, :show]

    def new
        @portfolio = Portfolio.new
    end

    def create 
        #this first part creates new stock db entry if not already there
        #look up stock, returns nill if not in db
        stock = Stock.all.find  {|stock| stock.ticker == params[:portfolio][:ticker]}
        if !stock   #if not in db, set params and create
            stock = Stock.create(ticker: paramas[:portfolio][:ticker])
        end

        #need to add stock id to portfolio creation params
        params[:portfolio][:stock_id] = stock.id


        #this is where validation goes

        #then we create the portfolio
        @current_investor.portfolios << Portfolio.create(portfolio_params)
        redirect_to portfolios_path
    end

    def index    
    end

    def show 
    end 

    def filledorders
        @positions = Portfolio.all
    end

    def sell
        @portfolio = Portfolio.new
        @positions = Portfolio.all
    end

    def edit 
    end 

    def update 
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
        @unique = Portfolio.unique_tickers(cookies[:investor_id].to_i)
    end

    def portfolio_vars
        
        @live_total = Portfolio.total_portfolio_value.round(2)
        @pp_total = Portfolio.total_portfolio_purchase_price
        # byebug
        if @pp_total == 0
            @percent_change = 0
            @balance = 0
            @positions = 0
        else 
            @percent_change =  100 *(@live_total-@pp_total)/@pp_total
            @balance = Portfolio.cash
            @positions = Portfolio.all
        end
    end
end
