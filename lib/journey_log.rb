require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :journey_history

  def initialize
    @journey_class = Journey.new
    @journey_history = []
  end

  def start(entry_station)
    journey_class.start(entry_station)
  end

  def end(exit_station)
    journey_class.end(exit_station)
    add(journey_class)
    @journey_class = Journey.new
  end

  def add(journey)
    journey_history << journey
  end


end
