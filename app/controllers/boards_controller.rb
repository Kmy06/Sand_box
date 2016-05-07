class BoardsController < ApplicationController
  def index
    @category = Category.find(params[:id])
    @boards = @category.boards
  	# @boards = Board.find(category_id: params[:id])
  end

  def show
    @categories = Category.find(params[:id])
  	@categories = Category.boards
  end

  def new
  	@board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = "Success !!!" # flash = {:key => "success", :value => "Success !!!"}
      redirect_to @board
    else
      render 'new'
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update_attributes(board_params)
      flash[:success] = "#{@board.title} is the new title !!!"
      redirect_to @board
    else
      render 'edit'
    end
  end
  
  def delete
    @board = Board.find(params[:id]).destroy
    flash[:warning] = "#{@board.title} has been Deleted"
    redirect_to boards_path
  end

  private

    def board_params
      params.require(:board).permit(:title)
    end
end