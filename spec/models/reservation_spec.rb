require 'spec_helper'

describe Reservation do
  before do
    restaurant = FactoryGirl.build(:restaurant)
    @table = FactoryGirl.create(:table)
    restaurant.tables << @table
  end

  it "cannot have 2 reservations for the same period of time" do
    reservation1 = FactoryGirl.create(:reservation, table_id: @table.id)
    reservation2 = FactoryGirl.build(:reservation, table_id: @table.id, start_time: reservation1.start_time)

    reservation2.should_not be_valid
    reservation2.errors[:start_time].should_not be_empty
    reservation2.errors[:end_time].should be_empty
  end
end
