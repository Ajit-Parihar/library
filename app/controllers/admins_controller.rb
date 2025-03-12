class AdminsController < ApplicationController
  def index
      # unless admin_present
      #   puts admin_present
      #     redirect_to admin_not_path
      # end
    
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
  end

  private

  def admin_params
    params.require(:admin).permit(:id,:firstName, :lastName, :email, :password, :password_confirmation)
  end
end
