class UsersController < ApplicationController
  def index
  	@user_activity= current_user.activities
  end

  def search_url
 
     if params[:search].present?
     	  begin
     	  	   @product = WebCrawler.process_url(params[:search])
     	  	   current_user.record_user_activity(@product,params[:search])
     	  	   render :show	
     	  rescue Exception => e
     	  	   flash[:error] = "Enter URl"
	 		   redirect_to(root_path)
     	  end	
	 else
		 flash[:error] = "Enter URl"
		 redirect_to(root_path)
	end
  end

  # def destroy
  # end
end
