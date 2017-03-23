require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :journey_history

  def initialize(journey_class)
    @journey_class = journey_class
    @journey_history = []
  end

  def start(entry_station)
  end


end
