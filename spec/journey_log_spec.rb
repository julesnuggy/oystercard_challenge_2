require 'journey_log.rb'

describe JourneyLog do

  let(:journey_dbl) { double(:journey_dbl) }
  let(:station_dbl) { double(:station_dbl) }
  subject(:jlog) { described_class.new(:journey_dbl) }

  before do
    minimum_fare = 1
    allow(journey_dbl).to receive(:start).with(1)
    allow(journey_dbl).to receive(:finish).with(1)
    allow(journey_dbl).to receive(:fare) { minimum_fare }
  end

  it 'starts a journey' do
    expect(journey_dbl).to recieve(:start)
    jlog.initiate(station_dbl)
  end

  it 'stops a journey' do
    expect(journey_dbl).to recieve(:finish)
    jlog.complete(station_dbl)
  end

  it 'logs a journey' do
    jlog.initiate(station_dbl)
    jlog.complete(station_dbl)
    expect(jlog.history[0]).to eq ({
      :entry => station_dbl,
      :exit => station_dbl,
      :fare => minimum_fare
    })
  end

end
