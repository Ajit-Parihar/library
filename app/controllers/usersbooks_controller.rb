class UsersbooksController < ApplicationController
  def index
   if user_present && check_session
      @user_id =  user_present.id
      @books = Book.where(user_id: @user_id)
   else
    redirect_to users_path, notice: "please login and signup needed"
    return
   end
  end
end
