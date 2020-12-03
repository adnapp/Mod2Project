class InvestorsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    
    def new 
        @investor = Investor.new
    end

    def create
        investor = Investor.create(investor_params)

        if investor.valid?
          cookies[:investor_id] = investor.id
          redirect_to investor_path(:investor_id)
        else
          flash[:errors] = investor.errors.full_messages
          redirect_to new_investor_path 
        end 
      end

    def edit
    end

    def update
    end

    def show
        @investor = Investor.find(params[:id])
    #   if @investor == @current_investor
    #     render :show
    #   else
    #      redirect_to new_investor_path 
    #   end 
  
    end

    def destroy
    end

    private

    def investor_params
        params.require(:investor).permit(:username, :password, :name, :bio, :investor_id)
    end 


end
