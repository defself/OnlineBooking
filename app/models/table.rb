class Table < ActiveRecord::Base
  has_many :reservations
  belongs_to :restaurant

  def reserved?
    self.reservations.any?
  end
end
