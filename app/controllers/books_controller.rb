class BooksController < ApplicationController
    before_action :find_book, except: [:new, :create, :index]
    before_action :authenticate_user!

    def index
      @user = User.find(params[:user_id])
      
    end
  
    def new
      @book = Book.new
    end

    def create
      @book = current_user.books.create(title: params[:book][:title]) 
      if @book.save
        redirect_to books_path(:user_id => current_user.id)
      else
        render :new
      end
    end

    def edit
   
    end
  
    def update
      @book.update(title: params[:book][:title])
      if @book.update
         redirect_to books_path(:user_id => current_user.id)
      else
        render :edit
      end
    end
  
    def destroy
      if (@book.title != "Global")
         @book.destroy
      end
      redirect_to books_path(:user_id => current_user.id)
    end
  
    def find_book
      @book = Book.find(params[:id])
    end

    private

    def books_params
      params.require(:book).permit(:title, notes_attributes: [:title, :content])
    end
  
   
  end
