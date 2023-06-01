class Order < ApplicationRecord
    has_many :order_tickets
    before_save :set_subtotal

    def subtotal
        order_tickets.collect {|order_ticket| order_ticket.valid? ? (order_ticket.quantity * order_ticket.unit_price) : 0}.sum 
    end

    private

    def set_subtotal
        self[:subtotal] = subtotal
    end
end
