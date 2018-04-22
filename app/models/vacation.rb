class Vacation < ApplicationRecord
  enum Transport: [:Airways, :Train, :Bus, :Cab]
  validates :Place, :Date, :Description, :Budget, :Transport, :Image, presence: true
  validates :Place, presence: true, length: {minimun: 5, maximum: 40}
  validates :Date, presence: true
  validates :Description, presence: true, length: {minimun: 20, maximum: 600}
  validates :Budget, presence: true
  validates :Transport, status: true
  belongs_to :customer 
end
