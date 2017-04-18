class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 2

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(value)
    fail "Maximum card balance £#{MAX_BALANCE}" if (@balance + value) > MAX_BALANCE
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    fail "Insufficient funds" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
