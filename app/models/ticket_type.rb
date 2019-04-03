class TicketType < ApplicationRecord
  belongs_to :event
  belongs_to :ticket_zone
	validates :price, numericality: { greater_than_or_equal_to: 0, :message => "price must be greater of equal to 0"}
end
