class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Cannot top up card. Max deposit (#{MAX_BALANCE}) exceeded. Try lower amount." if invalid_top_up?(amount)
    self.balance += amount
  end

  def touch_in(entry_station)
    fail "Cannot start journey. Minimum balance required is £#{MIN_BALANCE}. Top up." if low_balance?
    self.entry_station = entry_station
    # @journey = Journey.new
    # journey.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(MIN_FARE)
    self.exit_station = exit_station
    journeys << {entry_station: entry_station, exit_station: exit_station}
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  attr_writer :balance, :entry_station, :exit_station

  def invalid_top_up?(amount)
    amount + balance > MAX_BALANCE
  end

  def low_balance?
    balance < MIN_BALANCE
  end

  def deduct(amount)
    self.balance -= amount
  end



end
