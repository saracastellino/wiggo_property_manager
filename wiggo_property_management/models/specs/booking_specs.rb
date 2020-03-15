require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../booking.rb')
require_relative('../guest.rb')
require_relative('../property.rb')

class BookingTest < MiniTest::Test

def setup
  @property1 = Property.new("Villa del Glicine", "Villa", "Via lago Talere 22", "Chia", "Homeaway", 6, 400, "+39 070 8768878")
  @guest1 = Guest.new("AXL", "Rose", "American", "Feb 6 1965", "Driving licence", "+1 999 444 222 - 29500 Heathercliff Rd SPACE 194, Malibu, CA 90265")
  @booking1 = Booking.new(@guest1, @property1, 6, "Jul 4 2020", "Jul 31 2020", 27)
end

  def test_test_total_earning
    result = @booking1.total_earning(@nights, property1.daily_fee)
    assert_equal(700, result)
  end

end
