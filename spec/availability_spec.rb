require 'availability'
require 'spec_helper'

describe Availability do

  let(:availability) { described_class.new}

  it 'initializes with argument passed in as ARGV and returns the correct time format' do
    ARGV[0] = "08:00"
    expect(subject.time_requested).to eq "08:00:00"
  end

  it 'initializes with a json object with available appointments' do
    expect(subject.available_times.is_a?(Array)).to be true
  end

  it 'should raise an error on initialization if the time is outstide the oppening hours' do
    ARGV[0] = "07:00"
    expect { subject.check_time_requested(time_requested) }.to raise_error "Please select a time between #{Availability::FIRST_SLOT} & #{Availability::LAST_SLOT}"
  end

  it "should return the final appointment time based on availability" do
    ARGV[0] = "08:00"
    expect(subject.appoinment_time).to eq "Your appointment time is #{ARGV[0]}"
  end

end
