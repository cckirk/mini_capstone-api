class OrdersController < ApplicationController
  before_action :authenticate_user
  def create
    carted_products = CartedProduct.find_by(id: params[:carted_products_id])
    
    carted_products.each do |product|
      product = Product.find_by(id: carted_product.product_id)
    end
    calculated_subtotal = params[:quantity].to_i * carted_product.price
    calculated_tax = calculated_subtotal.to_i * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    carted_product.each do |element|
      element.status = "Purchased"
      element.save
      render json: {element.status}
    end
    order = Order.new(
      user_id: current_user.id, 
      product_id: params[:product_id] || order.price, 
      quantity: params[:quantity] || order.quantity,
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )

    order.save
    if order.save
      render json: order.as_json
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    order = Order.find_by(id: params[:id], user_id: current_user.id)
    render json: order.as_json
  end

  def index
    if current_user
      orders = Order.where(user_id: current_user.id)
      render json: orders.as_json
    else
      render json: [], status: :unauthorized
    end
  end
end
