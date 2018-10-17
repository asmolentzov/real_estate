class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end
  
  def add_room(room)
    @rooms << room
  end
  
  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end
  
  def area
    area = @rooms.map do |room|
      room.area
    end
    area.sum
  end
  
  def price_per_square_foot
    (@price.to_f / area.to_f).round(2)
  end
  
  def rooms_sorted_by_area
    sorted_rooms = @rooms.sort_by do |room|
      room.area
    end
    sorted_rooms.reverse
  end
  
  def rooms_by_category
    room_categories = {}
    @rooms.each do |room|
      room_categories[room.category] = 
        @rooms.find_all { |r| r.category == room.category }
    end
    room_categories
  end
  
end
