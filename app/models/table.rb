class Table < ActiveRecord::Base
  has_many :reservations
  belongs_to :restaurant
end
