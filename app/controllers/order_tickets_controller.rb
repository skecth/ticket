class OrderTicketsController < ApplicationController

    def show
        @order_ticket = OrderTicket.find(params[:id])
    end

    def create
        @order = current_order
        @order_ticket = @order.order_tickets.new(order_params)
        @order.save
        session[:order_id] = @order.id

        respond_to do |format|
            if @order_ticket.save
              format.html { redirect_to order_ticket_url(@order_ticket), notice: "Ticket was successfully created." }
              format.json { render :show, status: :created, location: @order_ticket }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @order_ticket.errors, status: :unprocessable_entity }
            end
          end
    end

    def update
        @order = current_order
        @order_ticket = @order.order_tickets.find(params[:id])
        @order_ticket.update(order_params)
        @order_tickets = current_order.order_tickets

        respond_to do |format|
            if @order_ticket.update(order_params)
              format.html { redirect_to order_ticket_url(@order_ticket), notice: "Ticket was successfully updated." }
              format.json { render :show, status: :ok, location: @order_ticket }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @order_ticket.errors, status: :unprocessable_entity }
            end
        end
    end
      

    private
    def order_params
        params.require(:order_ticket).permit(:quantity, :ticket_id)
    end
end
