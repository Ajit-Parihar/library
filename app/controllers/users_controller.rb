class UsersController < ApplicationController
  def index
      @books = Book.all
  end

  def show
     if user_present
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

      puts "adkfhaskdfasdjf"
        if @user.authenticate(password)
          puts "Correct Password!"
           session[:user_id] = @user.id
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
     end
  end
end
  def logOut
      session[:user_id] = nil
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
      # session[:user_set_time] = Time.current
      redirect_to users_path
     else
      redirect_to users_path, notice:   "fall sign in "
     end
    else
      redirect_to users_path, notice: "please login you are already sign in"
    end
  end

private

def user_params
     params.require(:user).permit(:id, :firstName, :lastName, :email, :password, :password_confirmation)
end
end
