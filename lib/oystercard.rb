class Oystercard
  DEFAULT_LIMIT = 90
  attr_reader :balance, :card_status

  def initialize(limit = DEFAULT_LIMIT)
    @balance = 0
    @limit = limit
    @card_status = :not_in_use
  end

  def top_up(amount)
    raise "Sorry, you've reached the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def deduct(fare_amount)
    journey = Journey.new
    journey.fare = fare_amount
    @balance -= journey.fare
  end

  def touch_in
    @card_status = :in_use if @card_status == :not_in_use
  end

  def touch_out
    @card_status = :not_in_use if @card_status == :in_use
  end

  def in_journey?
    @card_status == :in_use
  end
  
end
