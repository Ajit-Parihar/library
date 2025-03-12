class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def admin_present
    @admin_present ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
   helper_method :admin_present

   def user_present
    @user_present ||= User.find(session[:user_id]) if session[:user_id]
   end
   helper_method :user_present
end