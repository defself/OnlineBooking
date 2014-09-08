class Reservation < ActiveRecord::Base
  validates_presence_of :start_time, :end_time, :table_id
  validate :check_overlap, if: :table

  belongs_to :table

  def check_overlap
    new_range = start_time..end_time

    is_busy = table.reservations.select { |relation| new_range.overlaps?(relation.start_time..relation.end_time) }

    errors.add(:overbooking, "The table is already booked") unless is_busy.blank?
    is_busy.blank?
  end
end
