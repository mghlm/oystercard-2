class Oystercard

  attr_reader :balance, :in_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot top up card. Max deposit (#{MAX_BALANCE}) exceeded. Try lower amount." if invalid_top_up?(amount)
    self.balance += amount
  end

  def deduct(amount)   ## check in tests that this is "deduct"
    self.balance -= amount
  end

  def touch_in
    fail "Cannot start journey. Minimum balance required is £#{MIN_BALANCE}. Top up." if low_balance?
    self.in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)  ###check deduct name in tests
    self.in_journey = false
  end

  def in_journey?
    in_journey
  end

  private

  attr_writer :balance, :in_journey

  def invalid_top_up?(amount)
    amount + balance > MAX_BALANCE
  end

  def low_balance?
    balance < MIN_BALANCE
  end



end
