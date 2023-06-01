class Ticket < ApplicationRecord
  belongs_to :event, inverse_of: :tickets
  has_many :order_tickets
end
