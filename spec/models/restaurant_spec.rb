require 'spec_helper'

describe Restaurant do

  it 'should have relationships' do
    should have_many(:tables)
  end
end

