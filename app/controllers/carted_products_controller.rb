class CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      carted_products = current_user.carted_products
      render json: carted_products.as_json
    else
      render json: [], status: :unauthorized
    end
  end

  def create
     carted_product = CartedProduct.new(
       user_id: params[:user_id],
       product_id: params[:product_id] || carted_product.product_id, 
       quantity: params[:quantity] || carted_product.quantity,
       status: params[:status] || carted_product.status
     )
     carted_product.save
     if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    the_id = params[:id]
    carted_product = CartedProduct.find_by(id: the_id)
    carted_product.status = "removed"
    carted_product.save
    render json: carted_product.as_json && {message: "You just removed this carted_product"}
  end
  
end
