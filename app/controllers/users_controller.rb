class UsersController < ApplicationController
	
  def index
  end

  def search_url
   	@product = WebCrawler.process_url(params[:search])
   	p @product
  	render :show
  end

  # def destroy
  # end

end
