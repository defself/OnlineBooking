require 'spec_helper'

describe Table do
  let(:restaurant){ create :restaurant}
  let(:table){ create :table, restaurant: restaurant }

  it 'should have relationships' do
    should belong_to(:restaurant)
    should have_many(:reservations)
  end

  context '#reserved?' do

    it 'without reservations' do
      table.reserved?.should eq false
    end

    it 'with reservations' do
      table.reservations.create

      table.reserved?.should eq true
    end
  end
end
