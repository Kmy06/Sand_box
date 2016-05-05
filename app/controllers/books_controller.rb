class BooksController < ApplicationController
  def index
  	@books = Book.all
  end
  def create
  	Book.create title: params[:title]
  	redirect_to "/books"
  end
end
