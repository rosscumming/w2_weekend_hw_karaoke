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
    return true if guest.wallet >= entry_fee
    return false if guest.wallet < entry_fee
  end

  def room_starts_at_zero_capacity
    @occupants.length
  end







  # def room_capacity(room)
  #   room.length
  # end
  #
  # def check_guest_in()
  #
  # end
end
