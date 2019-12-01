require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../song')
require_relative('../guest')

class TestRoom < Minitest::Test

  def setup

    @room1 = Room.new("Blue Room", 3, 5)
    @room2 = Room.new("Red Room", 3, 10)
    @room3 = Room.new("Green Room", 3, 7)
    @all_rooms = [@room1, @room2, @room3]


    @song1 = Song.new("Beetlebum", "Blur")
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
    result = @room1.capacity
    assert_equal(3, result)
  end

  def test_check_room_starts_empty
    assert_equal(0, @room1.check_empty_room)
  end

  def test_add_guest_to_room
    room_has_guest = @room1.add_guest(@guest1)
    assert_equal(1, room_has_guest.length)
  end

  def test_can_remove_guest_from_room
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.remove_guest(@guest1)
    assert_equal(["Mark"], @room1.occupants_names)
  end


  def test_customer_wallet_decrease_when_entering_room
    @room1.add_guest(@guest1)
    @guest1.entry_fee(5)
    assert_equal(45, @guest1.wallet)
  end

  def test_initial_playlist_is_empty
    assert_equal(0, @room1.songs_in_playlist)

  end

  def test_add_song_to_playlist
    room_has_songs = @room1.add_song(@song1)
    assert_equal(1, room_has_songs.length)
  end

  def test_if_playlist_is_already_full
    room_playlist_is_full = @room1.add_song(@song1)
    room_playlist_is_full = @room1.add_song(@song2)
    room_playlist_is_full = @room1.add_song(@song3)
    assert_equal(3, room_playlist_is_full.length)
  end


  #
  # def test_check_rooms_total_capacity
  #   assert_equal(3, @room1.capacity)
  # end
  #
  # def test_check_room_starts_at_zero_capacity
  #   current_occupants = @room1.room_starts_at_zero_capacity
  #   assert_equal(0, current_occupants)
  # end
  #
  # def test_check_rooms_entry_fee_cost
  #   assert_equal(5, @room1.entry_fee)
  # end
  #
  # def test_check_guest_can_afford_room_if_true
  #   can_afford_room = @room1.can_afford_room(@guest1)
  #   assert_equal(true, can_afford_room)
  # end
  #
  # def test_check_guest_can_afford_room_if_false
  #   can_afford_room = @room3.can_afford_room(@guest3)
  #   assert_equal(false, can_afford_room)
  # end
  #
  # # def test_add_guest_to_room
  # #   guest_added_to_room = @room3.add_guest_to_room(@guest1)
  # #   assert_equal(1, guest_added_to_room)
  # # end
  #
  # def test_add_guest_into_room
  #   add_to_room = @room1.add_guest_to_room(@guest1)
  #   assert_equal(1, add_to_room.length)
  # end
  #
  # def test_remove_guest_from_room
  #   @room1.add_guest_to_room(@guest1)
  #   @room1.add_guest_to_room(@guest2)
  #   guest_removed =  @room1.remove_guest_from_room(@guest1)
  #   assert_equal("Harold", guest_removed)
  # end



end
