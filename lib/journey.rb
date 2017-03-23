class Journey

  attr_reader :entry_station, :exit_station
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def start(entry_station)
    @entry_station = entry_station
  end

  def end(exit_station)
    @exit_station = exit_station
  end

  def fare
    if exit_station.nil?
      PENALTY_FARE
    elsif entry_station.nil?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end

  def complete?
    !exit_station.nil?
  end



end
