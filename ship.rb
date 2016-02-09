require 'byebug'
class Ship
  attr_reader :length, :ship
  def initialize(length)
    @length = length
    @ship = []
  end

  def place(x, y, across)
    if @ship.empty?
      if across
        (x...x+@length).each do |place|
          @ship << [place, y]
        end
      else
        (y...y+@length).each do |place|
          @ship << [x, place]
        end
      end
    end
  end

  def covers?(x, y)
    if @ship.include?([x,y])
      true
    else
      false
    end
  end

  def overlaps_with?(another_ship)
    @ship.each do |coords|
      return true if another_ship.covers?(coords[0],coords[1])
    end
    return false
  end
end
