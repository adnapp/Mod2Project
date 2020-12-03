class Portfolio < ApplicationRecord
    belongs_to :investor
    belongs_to :stock


# let's try to build a method that will output an array of the unique stocks and their avg price -- make new array
#for total. we want average price paid and # of shares
# if name isnt there, add it to the array. conditional inside: if it's a buy, then 
#if name is there

@orders = Portfolio.all

arraystock = []
    def unique_tickers
        @orders.each do |order|
            order.stock.name
        end
        
        
    end

end
