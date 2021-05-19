class ApplicationController < ActionController::Base
<<<<<<< HEAD
  add_flash_types :info, :danger, :warning, :success
	helper_method :current_user,:categories
  include Pagy::Backend

  def current_user
  	if session[:user_id]
      @current_user ||= User.find(session[:user_id])
  	end
  end

  def categories
  	return Category.all
=======
	helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
>>>>>>> upstream/master
  end

end
