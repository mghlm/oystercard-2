class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def end(exit_station)
    exit_station
  end

  def fare
  end

  def finish

  end



end
