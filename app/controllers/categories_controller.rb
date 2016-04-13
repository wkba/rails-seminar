class CategoriesController < ApplicationController
  def new
  	@category = Category.new
  end
  
  def create
  	category_params = params.require(:category).permit(:name)
  	@category = Category.new(category_params)
  	 if @category.save
  	 	redirect_to @category, notice: 'category was successfuly created.'
  	 else
  	 	render :new
  	 end  	
  end

  def show
  	@category = Category.find(params[:id])
  end


  def index
  	@categories = Category.all
  end


end
