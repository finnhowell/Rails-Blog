class WelcomeController < ApplicationController
  def index
  	@name = params[:fullname]
  end

  def create
  	@name = params[:fullname]
  end

end
