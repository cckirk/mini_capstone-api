class ProductsController < ApplicationController
 
  def index
    products = Product.all
    render json: products
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params[:input_name] || product.name, 
      price: params[:input_price] || product.price, 
      description: params[:input_description] || product.descroption, 
      img_url: params[:input_img_url] || product.img_url
    )
    if product.save
      render json: product
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
    render json: product.as_json
  end
end
