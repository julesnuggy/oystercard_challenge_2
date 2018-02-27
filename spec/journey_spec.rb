require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  #let(:oyster_dbl) { double :oyster_dbl }
  let(:station_dbl) { double :station_dbl }
  let(:station_dbl_2) { double :station_dbl_2 }

  before do
    #allow(oyster_dbl).to receive(:balance) { 10 }
    #allow(oyster_dbl).to receive(:touch_in) { "Paddington" }
    #allow(oyster_dbl).to receive(:touch_out) { "Waterloo" }
    allow(station_dbl).to receive(:name) { }
    allow(station_dbl_2).to receive(:name) { }
  end

  it 'starts a Journey when you touch in' do
    expect { journey.start(station_dbl) }.to change { journey.entry_station }.from(nil).to(station_dbl)
  end

  it 'ends a Journey when you touch out' do
    expect { journey.finish(station_dbl_2) }.to change { journey.exit_station }.from(nil).to(station_dbl_2)
  end

  it 'knows when you don\'t complete a journey (no touch out)' do
    journey.start(station_dbl)
    expect(journey.finished?).to be_falsey
  end

  it 'knows when you don\'t complete a journey (no touch in)' do
    journey.finish(station_dbl_2)
    expect(journey.finished?).to be_falsey
  end

  it 'knows when you do complete a journey' do
    journey.start(station_dbl)
    journey.finish(station_dbl_2)
    expect(journey.finished?).to be_truthy
  end

  it 'charges a penalty fare by default if you don\'t complete a Journey (no touch out)' do
    journey.start(station_dbl)
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'charges a penalty fare by default if you don\'t complete a Journey (no touch in)' do
    journey.finish(station_dbl_2)
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'charges the minimum fare if you do complete a Journey' do
    journey.start(station_dbl)
    journey.finish(station_dbl_2)
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end

end
