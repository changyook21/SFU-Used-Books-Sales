class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
    
    def index
        # Check if user has selected a department - only display books from that department 
        if !params[:department].blank? 
          @department_id = Department.find_by(name: params[:department]).id
          @books = Book.where(:department_id => @department_id).order("created_at DESC")
        # Else, show every book in the database 
        else
          @books = Book.all.order("created_at DESC")
        end
        
        # Check if a cnumber has been entered and display all books from that department and cnumber
        if params[:cnumber]; params[:department]
          @books = Book.where('cast(cnumber as text) LIKE ? and cname LIKE ?', "%#{params[:cnumber]}%", "%#{params[:department]}%")
        end
        # Check if a user name or book title is entered in the form - display books from that user or with the book title 
        if params[:username]
          @books = Book.where('user_username LIKE ? or title LIKE ?', "%#{params[:username]}%", "%#{params[:username]}%")
        end
    end
    
    
    def show
    end

    def new
        @book = current_user.books.build
        @departments = Department.all.map {|c| [c.name, c.id]}
       
    end

    def create
        @book = current_user.books.build(book_params)
        @book.department_id = params[:department_id]
        @book.user_username = current_user.username
        @book.user_email = current_user.email
        
        # Set the department that the user has selected from the department database to the book
        if @book.department_id?
            @book.cname = @book.department.name
        end
        
        if @book.save
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def edit
        @departments = Department.all.map {|c| [c.name, c.id]}
    end
    
    def update
        @book.department_id = params[:department_id] 
        if @book.update(book_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end
    end
    
    def destroy
        @book.destroy
        redirect_to root_path
    end
    
    private
    
    # cnumber = course number; cname = department name
    def book_params
       params.require(:book).permit(:avatar, :title, :cname, :cnumber, :quality, :publisher, :campus, :price, :department_id) 
    end
    
    def find_book
        @book = Book.find(params[:id])
    end
    
end
