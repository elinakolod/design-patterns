class Lot
  def initialize(bet)
    @bet = bet || DefaultBet.create('Ivan')
  end

  def bet_accepted?
    bet.accept!
  end

  def bet_price
    bet.price
  end

  private

  attr_reader :bet
end

class DefaultBet
  attr_reader :buyer

  @instance_mutex = Mutex.new

  private_class_method :new

  def initialize(buyer)
    @buyer = buyer
  end

  def self.create(buyer)
    @instance || @instance_mutex.synchronize {  @instance ||= new(buyer) }
  end

  def accept!
    'Bet is accepted!'
  end

  def price
    0.25
  end
end

lot = Lot.new(nil)
puts lot.bet_price
puts lot.bet_accepted?

def test_singleton(value)
  singleton = DefaultBet.create(value)
  puts singleton.buyer
end

process1 = Thread.new { test_singleton('Petya') }
process2 = Thread.new { test_singleton('Vasya') }
process1.join
process2.join
