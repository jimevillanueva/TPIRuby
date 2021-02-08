class NotesController < ApplicationController
  before_action :find_note, except: [ :new, :create, :index]
  before_action :authenticate_user!

  def index
   
  end

  def show
  end

  def new
    @book = Book.find(params[:id])
    @note = Note.new
    @book.notes.build
    
  end
 
  def create
    @book = Book.find(params[:id])
    @note = @book.notes.create(title: params[:title],content: params[:content]) 
    if @note.save
      redirect_to  book_notes_path(@book.id)
    else
      render :new
    end

  end


  def edit
  end

  def update
    @note.update(title: params[:note][:title],content: params[:note][:content])
    @book = Book.find(params[:book_id])
    redirect_to book_notes_path(@book)
  end

  def destroy
    @note.destroy
    @book = Book.find(params[:book_id])
    redirect_to book_notes_path(@book)
  end

  def find_note
    @note = Note.find(params[:id])
  end
 
end
