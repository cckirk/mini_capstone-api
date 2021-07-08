class CartedProductsController < ApplicationController
  before_action :authenticate_user
  def index
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")

    render json: carted_products.as_json
    # if current_user
    #   carted_products = current_user.carted_products
    #   render json: carted_products.as_json
    # else
    #   render json: [], status: :unauthorized
    # end
  end

  def create
     carted_product = CartedProduct.new(
       user_id: current_user.id,
       product_id: params[:product_id] || carted_product.product_id, 
       quantity: params[:quantity] || carted_product.quantity,
       status: "carted"
     )
     carted_product.save
     if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    render json: {message: "You just removed this carted_product"}
  end

end
