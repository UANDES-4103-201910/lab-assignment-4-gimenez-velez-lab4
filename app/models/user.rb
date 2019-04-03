class User < ApplicationRecord
  has_many :orders
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, :message => "invalid mail"
	validates :phone, numericality: { less_than_or_equal_to: 999999999999} , :message => "phone must contain between 9 and 12 numbers"
	validates :phone, numericality: { greater_than_or_equal_to: 100000000}, :message => "phone must contain between 9 and 12 numbers"
end
