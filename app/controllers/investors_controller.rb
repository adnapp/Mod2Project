class InvestorsController < ApplicationController
    skip_before_action :authorized, only: [:new]
    def new 
        @investor = Investor.new
    end

    def create
        @investor = Investor.create(investor_params)
        redirect_to investor_path(@investor)
    end

    def edit
    end

    def update
    end

    def show
        @investor = Investor.find(params[:id])
    end

    def destroy
    end

    private

    def investor_params
        params.require(:investor).permit(:username, :password, :name, :bio)
    end 


end
