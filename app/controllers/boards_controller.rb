class BoardsController < ApplicationController
  def index
  	@boards = Board.all
  end

  def show
  	@board = Board.find(params[:id])
  end

  def new
  	@board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:success] = "Success !!!"
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
  
  private

    def board_params
      params.require(:board).permit(:title)
    end
end