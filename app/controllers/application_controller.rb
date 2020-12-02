class ApplicationController < ActionController::Base
  before_action :find_current_investor
  before_action :authorized

  def find_current_investor
    @current_investor = Investor.find_by(id: cookies[:investor_id])
  end 

  def authorized
    redirect_to investor_new_path unless @current_investor
  end 

end  
