class ProductsController < ApplicationController
 
  def index
    #get all the products from the db
    product = Product2.all
    render json: product.as_json
  end

  def show
    the_id = params[:id]
    product = Product2.find_by(id: the_id)
    render json: recipe.as_json 
  end
end
