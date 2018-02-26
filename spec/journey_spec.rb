require 'journey'
require 'oystercard'

describe Journey do
  oystercard = Oystercard.new
  journey = Journey.new

  it 'deducts a fare from the customer\'s oystercard' do
    oystercard.top_up(10)
    expect { oystercard.deduct(2) }.to change { oystercard.balance }.from(10).to(8)
  end
end
