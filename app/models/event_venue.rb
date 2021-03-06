class EventVenue < ApplicationRecord
	validates :name, length: {minimum:20, :message => "event name must be at least 20 characters long"}
	validates :capacity, numericality: { greater_than_or_equal_to: 0, :message => "capacity can not be negative"}
end
