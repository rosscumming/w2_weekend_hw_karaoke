class Room

  attr_reader :name, :capacity, :entry_fee

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @playlist = []
    @occupants = []

  end

  def can_afford_room(guest)
    guest.wallet >= entry_fee ?  true : false
  end

  def check_room_capacity
    @capacity.length
  end

  def check_empty_room
    @occupants.length
  end

  def add_song(song)
    @playlist.push(song)
  end

  def add_guest(guest)
    @occupants.push(guest)
  end

  def remove_guest(guest)
    @occupants.delete(guest)
  end

  def occupants_names
    @occupants.map {|name| name.name}
  end

  def songs_in_playlist
    @playlist.length
  end



  #
  # def room_starts_at_zero_capacity
  #   @occupants.length
  # end
  #
  # def add_guest_to_room(guest)
  #   @occupants << guest
  # end
  #
  # def remove_guest_from_room(guest)
  #   @occupants.delete(guest.name)
  #
  # end

  # def remove_guest_from_room(room, guest)
  #
  # end


  # def check_guest_in(guest)
  #   if guest.can_afford_room == true
  #     guest.push(@occupants)
  # end
  #




  # def room_capacity(room)
  #   room.length
  # end
  #
  # def check_guest_in()
  #
  # end
end
