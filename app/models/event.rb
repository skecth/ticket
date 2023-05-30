class Event < ApplicationRecord
    has_many :tickets, dependent: :destroy, inverse_of: :event

    accepts_nested_attributes_for :tickets, reject_if: :all_blank, allow_destroy: true
end
