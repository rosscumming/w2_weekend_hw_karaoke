class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song

  end

  def entry_fee(entry_fee)
    @wallet -= entry_fee
  end

  def favourite_song(song)
    p "whoo" if @fav_song == song
  end

end
