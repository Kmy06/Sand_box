class PagesController < ApplicationController
  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Success !!!" # flash = {:key => "success", :value => "Success !!!"}
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = category.find(params[:id])
  end

  def update
    @category = category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "#{@category.title} is the new title !!!"
      redirect_to @category
    else
      render 'edit'
    end
  end
  
  def delete
    @category = category.find(params[:id]).destroy
    flash[:warning] = "#{@category.title} has been Deleted"
    redirect_to categorys_path
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end