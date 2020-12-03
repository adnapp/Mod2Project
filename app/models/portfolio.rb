class Portfolio < ApplicationRecord
    belongs_to :investor
    belongs_to :stock


# let's try to build a method that will output an array of the unique stocks and their avg price -- make new array
#for total. we want average price paid and # of shares
# if name isnt there, add it to the array. conditional inside: if it's a buy, then 
#if name is there
#stocks = [{"tesla" => 4, {"apple" => 3 }]

@orders = Portfolio.all

    def self.unique_tickers
        stocklisting = []
        Portfolio.find_each do |trxn| #this gives us key value stock / quantity
            stock = {}
                if trxn.buysell
                    stock[trxn.stock.ticker] = trxn.quantity 
                else
                    stock[trxn.stock.ticker] = trxn.quantity * -1
                end
            stocklisting << stock
        end
        stocklisting.inject{|a,b| a.merge(b){|_,x,y| x + y}} #this combines hashes with same name
    end

    def self.total_portfolio_purchase_price
        @orders = Portfolio.all
        @total=0
        @orders.each do |t|
            if t.buysell #if stock is bought, this boolean is true
                p = t[:quantity] * t[:price]
                @total += p
            else
                p = t[:quantity] * t[:price] 
                @total -= p
            end
        end 
        @total
    end

    def self.total_portfolio_value 
        @orders = Portfolio.all
        self.api_client
        @total=0
        @orders.each do |t|
            if t.buysell #if stock is bought, this boolean is true
                
                p = t[:quantity] * @client.price(t.stock.ticker)
                @total += p
            else
                p = t[:quantity] * @client.price(t.stock.ticker) 
                @total -= p
            end
        end 
        @total
    end



    def self.api_client
        @client = IEX::Api::Client.new(
            publishable_token: 'Tpk_28e84a02533f42b19d47d6545f0083c3',
            secret_token: 'secret_token',
            endpoint: 'https://sandbox.iexapis.com/v1'
        )
        
    end

end
