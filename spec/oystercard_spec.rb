require 'oystercard'
  describe Oystercard do
    it 'should have a balance of 0 when initialized' do
      expect(Oystercard.new.balance).to eq 0
    end

    it 'should respond to #top_up by adding money to the balance' do
      oystercard = Oystercard.new
      expect { oystercard.top_up(10) }.to change {oystercard.balance}.by(10)
      expect { oystercard.top_up(10) }.to change {oystercard.balance}.from(10).to(20)
    end

  end
