require 'spec_helper'

describe Reservation do
  let(:restaurant){ create :restaurant }
  let(:table){ create :table, restaurant: restaurant }

  it 'should have relationships' do
    should belong_to(:table)
  end

  it 'should have validation' do
    should validate_presence_of(:start_time)
    should validate_presence_of(:end_time)
    should validate_presence_of(:table_id)
  end

  context '#check_overlap' do
    let(:reservation1){ create :reservation, table_id: table.id }

    let(:reservation2){ build :reservation, table_id: table.id, start_time: reservation1.start_time }

    it 'failed' do
      reservation2.should_not be_valid
      reservation2.errors[:overbooking].should include "The table is already booked"
    end

    it 'success' do
      reservation2.update_attributes(start_time: Time.now + 2.hours, end_time: Time.now + 3.hours)

      reservation2.should be_valid
      reservation2.errors[:overbooking].should be_empty
    end
  end
end
