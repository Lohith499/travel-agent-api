class Vacation < ApplicationRecord
  enum Transport: [:Airways, :Train, :Bus, :Cab]
  belongs_to :customer
end
