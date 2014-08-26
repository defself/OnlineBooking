class Reservation < ActiveRecord::Base
  validates_presence_of :start_time, :end_time, :table_id
  validate :overbooking

  belongs_to :table

  private
  def overbooking
    puts 'checking for overbooking...'
    # TODO: overlaps validation
  end
end
