class User < ApplicationRecord
  has_many :orders
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, :message => "invalid mail" }, presence: true
	validates :phone, numericality: { less_than_or_equal_to: 999999999999, :message => "phone must contain between 9 and 12 numbers"} 
	validates :phone, numericality: { greater_than_or_equal_to: 100000000, :message => "phone must contain between 9 and 12 numbers"}
	validates :password, length: {minimum:8, maximum: 12, :message => "password must contain between 8 and 12 alphanumeric characters"}
end
