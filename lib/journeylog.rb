class JourneyLog
  attr_accessor :entry_station, :exit_station
  attr_reader :history, :fare, :this_journey

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @history = []
    @this_journey = {}
  end

  def start(station = nil)
    current_journey
    @entry_station = station
    @this_journey[:entry] = station
  end

  def finish(station = nil)
    @exit_station = station
    @this_journey[:exit] = station
    #get_fare
    set_history
    @entry_station = @exit_station = nil
    station
  end

  def get_fare
    @this_journey[:fare] = @journey_class.fare
  end

  def complete?
    return (!@history[-1][:entry].nil? && !@history[-1][:exit].nil?) if !@history.empty?
  end

  private

  def current_journey
    @journey_class ||= journey_class.new
  end

  def set_history
    #get_fare
    @history << @this_journey.dup
  end

end
