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
    @song4 = Song.new("Motion Sicknesss", "Phoebe Bridgers")
    @playlist = [@song1, @song2, @song3, @song4]


    @guest1 = Guest.new("Harold", 50, @song1)
    @guest2 = Guest.new("Mark", 30, @song2)
    @guest3 = Guest.new("Jenny", 5, @song3)
    @guest4 = Guest.new("Bill", 10, @song4)
    @group1 = [@guest1, @guest2, @guest3, @guest4]
    @group2 = [@guest1, @guest2, @guest3]

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

  def test_check_group_can_enter_into_room_if_under_capacity
    assert_equal(true, @room1.check_capacity(@group2))
  end

  def test_check_group_cannot_enter_into_room_if_over_capacity
    assert_equal(false, @room1.check_capacity(@group1))
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

end
