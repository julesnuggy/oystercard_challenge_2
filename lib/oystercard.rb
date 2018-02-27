class Oystercard
  DEFAULT_LIMIT = 90
  attr_reader :balance

  def initialize(limit = DEFAULT_LIMIT, journey = Journey)
    @balance = 0
    @limit = limit
    @journey ||= journey.new
  end

  def top_up(amount)
    raise "Sorry, you've reached the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def touch_in(station_object)
    raise "Sorry, not enough credit in balance (£#{@balance})" if @balance < @journey.min_fare
    @journey.start
  end

  def touch_out(station_object)
    @journey.finish
    deduct(@journey.fare)
  end

  private

  def deduct(fare_amount)
    @balance -= fare_amount
  end

end
