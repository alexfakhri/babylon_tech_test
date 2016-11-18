require 'availability'
require 'spec_helper'

describe Availability do

  let(:availability) { described_class.new}

  it 'intializes with argument passed in as ARGV and returns the correct time format' do
    ARGV[0] = "08:00"
    expect(subject.time_requested).to eq "08:00:00"
  end

end
