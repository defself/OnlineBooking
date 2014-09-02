class Reservation < ActiveRecord::Base
  validates_presence_of :start_time, :end_time, :table_id
  validates :start_time, :end_time, overlap: { scope: 'table_id',
                                               message_content: 'overlaps with Tables other reservation' }

  belongs_to :table
end
