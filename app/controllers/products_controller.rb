class ProductsController < ApplicationController

  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all.sort_by &:name
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      flash[:alert] = "New product not created."
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      flash[:alert] = "Product #{@product} did not update. Try again!"
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:alert] = "#{@product.name} deleted!"
    redirect_to root_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
