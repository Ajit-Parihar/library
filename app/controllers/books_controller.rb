class BooksController < ApplicationController
   def index
   end
   def show
    if user_present && check_session
      @book = Book.find(params[:id])
     else
      redirect_to users_path, notice: "please login or signup"
     end
   end

   def new
      @book = Book.new
   end
   
   def create
      
      @book = Book.new(book_params)
      puts "dfjlasjdflasjdl"
      puts @book.inspect
       @book.user_id = user_present.id
       puts @book.inspect
       if @book.save
        redirect_to usersbooks_path, notice: "book create succssfully"
       end
   end
   
   def edit
      @book = Book.find(params[:id])
   end

   def update
      @book = Book.find(params[:id])
      if @book.update(book_params)  # Update user data
        redirect_to usersbooks_path(@user), notice: "User updated successfully!"
      else
        render :edit, alert: "Error updating user."
      end
   end

   def delete
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to usersbooks_path, notice: "delete succssfully"
   end

   private

def book_params
     params.require(:book).permit(:id, :ownerName, :title, :description, :bookCover )
end
end