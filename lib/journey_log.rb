require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :journey_history

  def initialize
    @journey_class = Journey.new
    @journey_history = []
  end

  def start(entry_station)
    # journey.start(entry_station)
  end

  # def end(exit_station)
  #   journey.finish(exit_station)
  #   add journey to journey_history
  #   create new journey instance
  # end


end
