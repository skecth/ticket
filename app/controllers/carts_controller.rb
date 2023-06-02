class CartsController < ApplicationController
  def show
    @order_tickets = current_order.order_tickets
  end
end
