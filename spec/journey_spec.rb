require 'journey'
require 'oystercard'

describe Journey do
  oystercard = Oystercard.new ### Need to make this a double at some point
  subject(:journey) {described_class.new}

  before do
    oystercard.top_up(1)
  end


end
