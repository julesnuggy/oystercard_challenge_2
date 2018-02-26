require 'oystercard'
  describe Oystercard do
    oystercard = Oystercard.new
    it 'should have a balance of 0 when initialized' do
      expect(Oystercard.new.balance).to eq 0
    end

    it 'should respond to #top_up by adding money to the balance' do

      expect { oystercard.top_up(10) }.to change {oystercard.balance}.by(10)
      expect { oystercard.top_up(10) }.to change {oystercard.balance}.from(10).to(20)
    end

    it 'should raise an error when exceed the limit' do

      expect { oystercard.top_up(100) }.to raise_error("Sorry, you've reached the limit of £#{Oystercard::DEFAULT_LIMIT}")
    end

  end
