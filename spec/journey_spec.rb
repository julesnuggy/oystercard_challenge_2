require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:oyster_dbl) { double(:oyster_dbl) }
  let(:station_dbl) { double(:station_dbl) }
  let(:station_dbl_2) { double(:station_dbl_2) }

  before do
    allow(oyster_dbl).to receive(:entry_station) { :station_dbl }
    allow(oyster_dbl).to receive(:exit_station) { :station_dbl_2 }
  end


  it 'should start a journey on touch in' do
    expect(journey.start(station_dbl)).to eq station_dbl
  end

  it 'should finish a journey on touch out' do
    expect(journey.finish(station_dbl_2)).to eq station_dbl_2
  end

  it 'should calculate the journey fare' do

  end

=begin
  it 'should tell us if the journey is complete' do
    journey.start(station_dbl)
    journey.finish(station_dbl_2)
    expect(journey.complete?).to be_truthy
  end

  it 'should tell us if the journey is incomplete (no touch in)' do
    journey.finish(station_dbl_2)
    expect(journey.complete?).to be_falsey
  end

  it 'should tell us if the journey is incomplete (no touch out)' do
    journey.start(station_dbl)
    expect(journey.complete?).to be_falsey
  end

  it 'shoud log a single complete journey' do
    journey.start(station_dbl)
    journey.finish(station_dbl_2)
    expect(journey.history).to eq [{entry: station_dbl, exit: station_dbl_2, fare: 1}]
  end

  it 'should log multiple journeys' do
    journey.start(station_dbl)
    journey.finish(station_dbl_2)
    journey.start(station_dbl)
    journey.finish(station_dbl_2)
    expect(journey.history).to eq [{entry: station_dbl, exit: station_dbl_2, fare: 1}, {entry: station_dbl, exit: station_dbl_2, fare: 1}]
  end
=end
end
