class User < ApplicationRecord
  has_many :orders
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
 
  before_validation :ensure_email_has_a_value
 
  private
    def ensure_email_has_a_value
      if email.nil?
        self.email = email unless email.blank?
      end
    end
end
