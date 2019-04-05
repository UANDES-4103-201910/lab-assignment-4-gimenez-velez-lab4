class Order < ApplicationRecord
  belongs_to :user
  has_many :tickets
  before_validation :buy_validation
end
