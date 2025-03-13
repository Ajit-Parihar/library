class BooksController < ApplicationController
   def index
   end
   def show
    if user_present
      @book = Book.find(params[:id])
     else
      redirect_to users_path, notice:"please login or signup"
     end
   end

   def new
      @book = Book.new
   end

   def create
    
      @book = Book.new(book_params)
      # puts "dfjlasjdflasjdl"
      # puts @book.inspect
      #  @book.user_id = user_present.id
      #  puts @book.inspect

       if @book.save
        redirect_to users_path, notice:"book create succssfully"
       end
   end


   private

def book_params
     params.require(:book).permit(:id, :ownerName, :title, :description, )
end

end