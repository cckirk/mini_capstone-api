class OrdersController < ApplicationController
  before_action :authenticate_user
  def create
    carted_products = CartedProduct.where(user_id: current_user.id, status: "carted")
    
    calculated_subtotal = 22
    calculated_tax = calculated_subtotal.to_i * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    carted_products.each do |element|
      element.update(status: "purchased", order_id: order.id)
    end

    carted_products.each do |element|
      calculated_subtotal = 22
      tax = calculated_tax
      end
    end
    order = Order.new(
      user_id: current_user.id, 
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
