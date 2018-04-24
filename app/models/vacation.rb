class Vacation < ApplicationRecord
  enum Transport: [:Airways, :Train, :Bus, :Cab]
  validates :Place, presence: true, length: {minimun: 5, maximum: 40}
  validates :VacationDate, presence: true
  validates :Description, presence: true, length: {minimun: 20, maximum: 600}
  validates :Budget, presence: true
  validates :Transport, presence: true
  belongs_to :customer
end
