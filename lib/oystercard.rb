class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 2

  attr_reader :balance, :in_journey, :entry_station

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station
  end

  def in_journey?
    @in_journey
  end

  def top_up(value)
    fail "Maximum card balance £#{MAX_BALANCE}" if (@balance + value) > MAX_BALANCE
    @balance += value
  end

  def touch_in(station)
    fail "Insufficient funds, you need to have the minimum amount (£#{MIN_FARE}) for a single journey." if @balance < MIN_FARE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  private

  def deduct(value)
    @balance -= value
  end

end
