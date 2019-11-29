require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')


class TestSong < Minitest::Test

  def setup
    @song = Song.new("Parklife")

  end


  def test_song_has_name
    assert_equal("Parklife", @song.name)
  end

  

end
