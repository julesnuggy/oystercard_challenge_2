class Journey
attr_accessor :entry_station, :exit_station, :min_fare
attr_reader :history, :fare

PENALTY_FARE = 6
MINIMUM_FARE = 1

  def initialize(min_fare = MINIMUM_FARE)
    @min_fare = min_fare
    @history = []
  end

  def start(station = nil)
    @entry_station = station
  end

  def finish(station = nil)
    @exit_station = station
    set_fare(@entry_station, @exit_station)
    set_history(@entry_station, @exit_station, @fare)
    @entry_station = @exit_station = nil
    station
  end

  def complete?
    return (!@history[-1][:entry].nil? && !@history[-1][:exit].nil?) if !@history.empty?
  end

  private

  def set_history(entry_station, exit_station, fare)
    @history << {entry: entry_station, exit: exit_station, fare: fare}
  end

  def set_fare(entry_station, exit_station)
    @fare = PENALTY_FARE if !complete?
    @fare = MINIMUM_FARE
  end
end
