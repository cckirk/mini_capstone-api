class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]

  def index
    if params[:category]
      category = Category.find_by(name: params[:category])
      products = category.products
    else
      products = Product.all
    end
    render json: products
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product
  end

  def create
    product = Product.new(
    name: params[:input_name] || product.name, 
    price: params[:input_price] || product.price, 
    description: params[:input_description] || product.descroption, 
    img_url: params[:input_img_url] || product.img_url
    )
    product.save
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.name = params[:input_name]
    product.price = params[:input_price]
    product.description = params[:input_description]
    product.img_url = params[:input_img_url]
    product.save
    render json: product.as_json
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render json: product.as_json && {message: "You just deleted this product"}
  end
end
