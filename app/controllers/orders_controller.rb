class OrdersController < ApplicationController

  def update_order_status
    order = Order.find_by_id(params[:id])
    if order
      if order.update(:order_status => params[:order_status])
        render json: {message: "status updated succesfully" , status: 200}
      else
        render json: {message: "failed" , status: :unprocessable_entity}
      end
    else
      render json: {message: "Order not found" , status: 200}
    end

  end

  def update_payment_status
    order = Order.find_by_id(params[:id])
    if order
      if order.update(:payment_status => params[:payment_status])
        render json: {message: "status updated succesfully" , status: 200}
      else
        render json: {message: "failed" , status: :unprocessable_entity}
      end
    else
      render json: {message: "Order not found" , status: 200}
    end
  end

  def cancel_order
    order = Order.find_by_id(params[:id])
    if order
      if order.order_status != "SERVED"
        if order.destroy
          render json: {message: "order cancelled succesfully" , status: 200}
        else
          render json: {message: "order failed to cancelled", status: 200}
        end
      else
        render json: {message: "order status is already Served!" , status: 200}
      end
    else
      render json: {message: "Order not found" , status: 200}
    end
  end
end
