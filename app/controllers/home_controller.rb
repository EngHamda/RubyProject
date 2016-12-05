class HomeController < ApplicationController
  def index
  	if current_user#user_signed_in?
  		redirect_to courses_path
  	# 	redirect_to courses_path
  	 else
  	# 	redirect_to new_user_session_path 
	    @courses = Course.all
 		
  	end
  end
end
