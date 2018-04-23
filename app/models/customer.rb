class Customer < ApplicationRecord
  validates :FirstName, presence: true, length: {minimum: 5, maximum: 25}
  validates :LastName, presence: true, length: {minimum: 5, maximum: 25}
  validates :Phone, presence: true, length: {minimum: 10, maximum: 10}
  validates :Address, presence: true,length: {minimum: 20, maximum: 600}
  validates :TravelAgent_email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :TravelAgent_email, length: {maximum: 105},
        format: { with: VALID_EMAIL_REGEX }
has_many :vacations
end
