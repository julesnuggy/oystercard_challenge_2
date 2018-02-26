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

    it "should start the journey when touch in" do
      expect { oystercard.touch_in }.to change {oystercard.card_status}.from(:not_in_use).to(:in_use)
    end

    it 'should end the journey when touch out' do
      expect { oystercard.touch_out }.to change {oystercard.card_status}.from(:in_use).to(:not_in_use)
    end

    it 'should be true when card_status is in_use' do
      oystercard.touch_in
      expect(oystercard.in_journey?).to be_truthy
    end

    it 'should be false when card_status is not_in_use' do
      oystercard.touch_out
      expect(oystercard.in_journey?).to be_falsey
    end

  end
