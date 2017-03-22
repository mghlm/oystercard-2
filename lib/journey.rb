class Journey

  attr_reader :current_trip, :entry_station

  def initialize(entry_station = "Aldgate")
    @current_trip = {}
    @entry_station = entry_station
  end

  def start(entry_station)
    entry_station
  end

  def end(exit_station)
    exit_station
  end

  def fare
  end

  def finish

  end



end
