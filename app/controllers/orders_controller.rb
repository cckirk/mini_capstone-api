class OrdersController < ApplicationController
  def create
    order = Order.new(
      user_id: params[:user_id] || order.user_id, 
      product_id: params[:product_id] || order.price, 
      quantity: params[:quantity] || order.quantity,
      subtotal: params[:subtotal] || order.subtotal,
      tax: params[:tax] || order.tax,
      total: params[:total] || order.total
    )
    if order.save
      render json: order
    else
      render json: {errors: order.errors.full_messages}, status: :unprocessable_entity
    end
  end
    def show
      the_id = params[:id]
      order = Order.find_by(id: the_id)
      render json: order.as_json
    end
end
