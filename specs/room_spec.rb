require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestRoom < Minitest::Test

  def setup

    @room1 = Room.new("Blue Room", 3, 5)
    @room2 = Room.new("Red Room", 2, 10)
    @room3 = Room.new("Green Room", 3, 7)
    @all_rooms = [@room1, @room2, @room3]


    @song1 = Song.new("Beezlebum", "Blur")
    @song2 = Song.new("The chain", "Fleetwood Mac")
    @song3 = Song.new("Size of the moon", "Pinegrove")
    @playlist = [@song1, @song2, @song3]


    @guest1 = Guest.new("Harold", 50, @song1)
    @guest2 = Guest.new("Mark", 30, @song2)
    @guest3 = Guest.new("Jenny", 5, @song3)
    @group = [@guest1, @guest2, @guest3]

  end

  def test_check_room_name
    assert_equal("Blue Room", @room1.name)
  end

  def test_check_rooms_total_capacity
    assert_equal(3, @room1.capacity)
  end

  def test_check_room_starts_at_zero_capacity
    current_occupants = @room1.room_starts_at_zero_capacity
    assert_equal(0, current_occupants)
  end

  def test_check_rooms_entry_fee_cost
    assert_equal(5, @room1.entry_fee)
  end

  def test_check_guest_can_afford_room_if_true
    can_afford_room = @room1.can_afford_room(@guest1)
    assert_equal(true, can_afford_room)
  end

  def test_check_guest_can_afford_room_if_false
    can_afford_room = @room3.can_afford_room(@guest3)
    assert_equal(false, can_afford_room)
  end


  # def test_check_capacity_of_room_starts_at_zero
  #   assert_equal(0, @room3.room_capacity.length)
  #
  #   # @room1.add_guest_to_a_room(@guest1)
  #   # assert_equal(1, @room1.capacity)
  # end
  #
  # def add_guest_to_a_room
  #   assert_equal(1, @room1.)
  # end

end
