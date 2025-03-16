class AdminsController < ApplicationController
  def index

      session.delete(:user_id) 
      session.delete(:time) 
      
      @books = Book.all 
    
  end

  def alluser
    @users = User.all
  end

  def new
    @admin = Admin.new
  end

  def create
     @admin = Admin.new(admin_params)
     if @admin.save
      session[:admin_id] = @admin.id

         redirect_to admins_path, notice: "admin create succssfully"
     end
  end

  def show
      @user = User.find(params[:id])
  end

  def logOut
    session[:admin_id] = nil
    session[:user_id] = nil
    redirect_to users_path, notice: "admin log out"
  end

  private

  def admin_params
    params.require(:admin).permit(:id,:firstName, :lastName, :email, :password, :password_confirmation)
  end
end
