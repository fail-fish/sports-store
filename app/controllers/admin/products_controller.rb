class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  # rubocop:disable Metrics/MethodLength
  def create
    @product = Product.new(product_params)

    if @product.save
      category_array.each do |cat|
        @category = Category.find(cat)
        @product.categories << @category
      end

      flash[:notice] = 'Product added!'
      redirect_to admin_products_path
    else
      flash[:notice] = 'Product can\'t be blank!'
      render 'admin/products/new'
    end
  end

  def edit
    product
  end

  # rubocop:disable Metrics/AbcSize
  def update
    if product.update(product_params)
      product.product_category_relationships.destroy_all

      category_array.each do |cat|
        @category = Category.find(cat)
        product.categories << @category
      end

      flash[:notice] = 'Product updated!'
      redirect_to admin_products_path
    else
      render :edit
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize

  def destroy
    product.destroy
    flash[:notice] = 'Product removed!'
    redirect_to admin_products_path
  end

  private

  def product
    @product ||= Product.find(params[:id])
  end

  def category_array
    params.dig(:product, :category_ids)
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
