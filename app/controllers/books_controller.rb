class BooksController < ApplicationController
    before_action :find_book, only: [:show, :edit, :update, :destroy]
    skip_before_action :authenticate_user!, only: :index
    
    # after_action :verify_authorized, except: :index
    # after_action verify_policy_scoped, only: :index

    def index
        policies = policy_scope(Book)
        
        if params[:category].blank?
            @books = Book.order("created_at DESC")
        else
            @category = Category.find_by(name: params[:category])
            @books = @category.books
        end
    end

    def new
        @book = current_user.books.build
        @categories = Category.pluck(:name, :id)
    end

    def create      
        if @book = Book.create(book_params)
          redirect_to root_path
        else
          render 'new'
        end
      end

    def edit
        @categories = Category.pluck(:name, :id)
    end

    def update 
        @book.category_id = params[:category_id]
        @book = Book.find(params[:id])
        authorize @book
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

    def book_params
        params.require(:book).permit(:title, :description, :author,:category_id, :book_img).merge(user_id: current_user.id)
        end

    def find_book
        @book = Book.find(params[:id])
        authorize @book 
    end
end
