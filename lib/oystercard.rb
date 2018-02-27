class Oystercard
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :minimum_fare, :entry_station, :exit_station, :history, :hash

  def initialize(limit = DEFAULT_LIMIT, minimum = MINIMUM_FARE)
    @balance = 0
    @limit = limit
    @minimum_fare = minimum
    @history = []
  end

  def top_up(amount)
    raise "Sorry, you've reached the limit of £#{@limit}" if @balance + amount > @limit
    @balance += amount
  end

  def touch_in(station_object)
    raise "Sorry, not enough credit in balance (£#{@balance})" if @balance < @minimum_fare
    @entry_station = station_object.name
  end

  def touch_out(station_object)
    deduct(@minimum_fare)
    @exit_station = station_object.name
    @history << {:entry => @entry_station, :exit => @exit_station}
    @entry_station = nil
  end

  def in_journey?
    # Return true if @entry_station is NOT nil (i.e. in journey)
    !@entry_station.nil?
    # Also the same as `!!@entry_station`
  end

  private

  def deduct(fare_amount)
    @balance -= fare_amount
  end

end
