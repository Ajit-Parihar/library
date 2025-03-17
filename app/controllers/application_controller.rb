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

  def check_session
    time1 = Time.current
    if session[:time].present?
    time2 = Time.parse(session[:time])
     formatted_time1 = time1.strftime("%M").to_i  # Get minutes as an integer
     formatted_time2 = time2.strftime("%M").to_i 
     puts "00000"
     puts formatted_time1-formatted_time2
    
      if formatted_time1-formatted_time2 > 30
        session.delete(:user_id)
        session.delete(:time)
        flash[:notice] = "your session has expired. Please log in again."
        
        return false
      end
      return true
    end
end
   helper_method :check_session
end