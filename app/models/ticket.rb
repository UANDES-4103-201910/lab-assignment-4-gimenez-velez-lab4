class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
	before_validation :valid_date
	def valid_date
		if ticket_type.event.start_date<Date.today
			errors.add(:ticket, "can't create tickets for past events")
		end
	end
end
