class UsersController < ApplicationController
  def index
      @books = Book.all
  end

  def show
     if user_present
        @book = Book.find(params[:id])
     else
      redirect_to users_path, notice:"please login or signup"
    end
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)  
     if @user.save
      session[:user_id] = @user.id
      session[:user_set_time] = Time.current
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
