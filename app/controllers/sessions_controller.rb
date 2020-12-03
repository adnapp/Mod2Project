class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :login]
  

  
    def logout
      cookies.delete(:investor_id)
      redirect_to investor_new_path
    end 
  
    def new 
    end 
  
    def login
      investor = Investor.find_by(username: params[:session][:username])
  
      if investor && investor.authenticate(params[:session][:password])
        cookies[:investor_id] = investor.id
        redirect_to investor_path(investor)
      else
        flash[:errors] = "Username or Password is not valid" 
        redirect_to new_login_path
      end 
    end 
  
  end