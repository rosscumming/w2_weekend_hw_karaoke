require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')


class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("Beetlebum", "Blur")
    @song2 = Song.new("The chain", "Fleetwood Mac")
    @song3 = Song.new("Size of the moon", "Pinegrove")

  end

  def test_check_song_has_name
    assert_equal("Size of the moon", @song3.name)
  end

  def test_check_song_artist
    assert_equal("Pinegrove", @song3.artist)
  end


end
