class UsersController < ApplicationController
  def index
      @books = Book.all
  end

  def show
    puts "jahsdkfaj"
    puts user_present.inspect
     if user_present
         redirect_to users_path, notice:"User login succssfully"
     else
      redirect_to users_path, notice:"please login or signup"
    end
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
     puts "sd;lfjasdjf"
     puts @user.inspect
     if @user.save
      puts "sdfna;lsdjf"
      puts @user_id
      session[:user_id] = @user_id
      redirect_to users_path
     else
      redirect_to users_path, notice:"fall sign in "
     end
  end



private

def user_params
     params.require(:user).permit(:id, :firstName, :lastName, :email, :password, :password_confirmation)
end



  
end
