require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestGuest < Minitest::Test

  def setup
    @song1 = Song.new("Beetlebum", "Blur")
    @song2 = Song.new("The chain", "Fleetwood Mac")
    @song3 = Song.new("Size of the moon", "Pinegrove")
    @song4 = Song.new("Motion Sicknesss", "Phoebe Bridgers")
    @guest1 = Guest.new("Harold", 50, @song1)
    @guest2 = Guest.new("Mark", 30, @song2)
    @guest3 = Guest.new("Jenny", 5, @song3)
    @guest4 = Guest.new("Bill", 10, @song4)


  end

  def test_check_customer_has_name
    assert_equal("Jenny", @guest3.name)
  end

  def test_check_guest_has_favourite_song
    assert_equal(@song3, @guest3.fav_song)
  end

  def test_check_guest_has_money
    assert_equal(5, @guest3.wallet)
  end

  def test_check_guest_wallet_can_decrease
    @guest1.entry_fee(5)
    assert_equal(45, @guest1.wallet)
  end

  def test_check_guest_has_favourite_song_and_return_if_matches
    assert_equal("whoo", @guest1.favourite_song(@song1))
  end


end
