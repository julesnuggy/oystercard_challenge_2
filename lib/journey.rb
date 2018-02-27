class Journey
attr_accessor :fare, :entry_station, :exit_station

PENALTY_FARE = 6
MINIMUM_FARE = 1

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def finished?
    @entry_station && @exit_station
  end

  def fare
    finished? ? MINIMUM_FARE : PENALTY_FARE
  end
end
