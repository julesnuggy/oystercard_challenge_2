require 'oystercard'
  describe Oystercard do
    #oystercard = Oystercard.new
    subject(:oystercard) {described_class.new}
    subject(:oystercard_empty) {described_class.new}

    before do
      oystercard.top_up(1)
    end

    describe "check balance and enforce limits" do

      it 'should have a balance of 0 when initialized' do
        expect(oystercard_empty.balance).to eq 0
      end

      it 'should respond to #top_up by adding money to the balance' do
        expect { oystercard.top_up(10) }.to change {oystercard.balance}.by(10)
      end

      it 'should raise an error when exceed the limit' do
        expect { oystercard.top_up(100) }.to raise_error("Sorry, you've reached the limit of £#{Oystercard::DEFAULT_LIMIT}")
      end

      it 'should raise an error when below minimum balance' do
        expect { oystercard_empty.touch_in }.to raise_error("Sorry, not enough credit in balance (£#{oystercard_empty.balance})")
      end

      it 'should NOT raise an error when at minimum balance' do
        oystercard.top_up(1)
        expect { oystercard.touch_in }.not_to raise_error
      end

      it 'should readuce the balance by minimum fare when touch_out' do
        oystercard.top_up(1)
        expect { oystercard.touch_out }.to change {oystercard.balance}.by(-1)
      end

    end

    describe "check and change card_status" do
      it "should start the journey when touch in" do
        oystercard.top_up(1)
        expect { oystercard.touch_in }.to change {oystercard.card_status}.from(:not_in_use).to(:in_use)
      end

      it 'should end the journey when touch out' do
        oystercard.touch_in
        expect { oystercard.touch_out }.to change {oystercard.card_status}.from(:in_use).to(:not_in_use)
      end

      it 'should be false when card_status is not_in_use' do
        expect(oystercard.in_journey?).to be_falsey
      end

      it 'should be true when card_status is in_use' do
        oystercard.touch_in
        expect(oystercard.in_journey?).to be_truthy
      end



    end

  end
