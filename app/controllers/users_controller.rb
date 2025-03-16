class UsersController < ApplicationController
  def index
    
    if user_present && check_session
      
      @user = user_present
    else
       @user = false
    end
      @books = Book.all
  end

  def show
     if user_present && check_session
        @book = Book.find(params[:id])
     else
      redirect_to users_path, notice: "please login or signup"
    end
  end

  def new
    puts "lkaldjflaj"
    puts admin_present.inspect
    unless admin_present
       redirect_to users_path, notice: "admin not exist please try again" 
    end
    @user = User.new
end

  def login
     
  end

  def loginUser
      email = params[:email]  
      password = params[:password]  
      @user = User.find_by(email: email)

     if@user.present?
      if user_present
        puts "00000"
        puts user_present.inspect
         redirect_to users_path, notice: "you are already login please use library"
         return
      end

      puts "adkfhaskdfasdjf"
        if @user.authenticate(password)
          puts "Correct Password!"
           session[:user_id] = @user.id
           session[:time] = Time.current

          #  AccountMailer.with(account: @user).signup_login_email.deliver_now


          redirect_to users_path, notice: "users login succssfully"
        else
          redirect_to login_user_path, notice: "Invalid password"
        end
     else
       
      @admin = Admin.find_by(email: email)
      if @admin.present? 
         if @admin.authenticate(password)
           puts "Correct Password!"
             session[:admin_id] = @admin.id
             redirect_to admins_path, notice: "welcome admin to your library"
         else
              redirect_to admin_logIn_path, notice: "admin can't login"
         end
        else
            redirect_to users_path, notice:"user does't exist please sign up"
            return
        end
  end
end
  def logOut
      session.delete(:user_id) 
      session.delete(:time) 
      redirect_to users_path, notice: "user log out"
  end

  def create
     @user = User.new(user_params)  
     puts "jadlf"
     puts @user.inspect
     @prsentUser = User.find_by(email: @user.email)
     unless @prsentUser.present?
     if @user.save
      session[:user_id] = @user.id
      session[:time] = Time.current
      # AccountMailer.with(account: @user).signup_login_email.deliver_now
      redirect_to users_path
      return
     else
      redirect_to users_path, notice:   "fall sign in "
      return
     end
    else
      redirect_to users_path, notice: "please login you are already sign in"
      return
    end
  end

private

def user_params
     params.require(:user).permit(:id, :firstName, :lastName, :email, :profileImage,:password, :password_confirmation)
end
end
