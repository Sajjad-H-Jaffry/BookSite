class ContentsController < ApplicationController
    before_action :find_book
    before_action :find_review, only: [:edit, :update, :destroy]

    def new
        @content = Content.new 
    end

    def create
        @content = Content.new(content_params)
        @content.book_id = @book.id
        @content.user_id = current_user.id

        if @content.save
            redirect_to book_path(@book)
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
    
        if @content.update(content_params)
            redirect_to book_path(@book)
        else
            render 'edit'
        end
    end

    def destroy
        @content.destroy
        redirect_to book_path(@book)
    end

    private

    def content_params
        params.require(:content).permit(:title, :subtitle)
    end

    def find_book
        @book = Book.find(params[:book_id])
    end

    def find_review
        @content = Content.find(params[:id])
    end

end
