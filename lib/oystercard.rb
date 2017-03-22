class Oystercard

  attr_reader :balance, :entry_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail "Cannot top up card. Max deposit (#{MAX_BALANCE}) exceeded. Try lower amount." if invalid_top_up?(amount)
    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

  def touch_in(entry_station)
    fail "Cannot start journey. Minimum balance required is £#{MIN_BALANCE}. Top up." if low_balance?
    self.entry_station = entry_station
  end

  def touch_out
    deduct(MIN_FARE)
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  attr_writer :balance, :entry_station

  def invalid_top_up?(amount)
    amount + balance > MAX_BALANCE
  end

  def low_balance?
    balance < MIN_BALANCE
  end



end
