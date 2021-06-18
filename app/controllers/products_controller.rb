class ProductsController < ApplicationController
 
  def index
    #get all the products from the db
    product = Product.all
    render json: product.as_json
  end

  def show
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    render json: recipe.as_json 
  end

  def create
    product = Product.new(
      name: params[:input_options], 
      price: params[:input_options], 
      description: params[:input_options], 
      img_url: params[:input_options]
    )
    product.save
    render json: product.as_json
  end
end
