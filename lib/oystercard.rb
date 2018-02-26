class Oystercard
  DEFAULT_LIMIT = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance, :minimum_balance
  attr_accessor :card_status

  def initialize(limit = DEFAULT_LIMIT, minimum = MINIMUM_BALANCE)
    @balance = 0
    @limit = limit
    @minimum_balance = minimum
    @card_status = :not_in_use
  end

  def top_up(amount)
    raise "Sorry, you've reached the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def touch_in
    raise "Sorry, not enough credit in balance (£#{@balance})" if @balance < @minimum_balance
    @card_status = :in_use if @card_status == :not_in_use
  end

  def touch_out
    @card_status = :not_in_use if @card_status == :in_use
    deduct(@minimum_balance)
  end

  def in_journey?
    @card_status == :in_use
  end

  private

  def deduct(fare_amount)
    journey = Journey.new
    journey.fare = fare_amount
    @balance -= journey.fare
  end
end
