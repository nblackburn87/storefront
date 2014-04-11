class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "New product created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
