require 'byebug'
require './position.rb'
class Ship
  attr_reader :length, :ship
  def initialize(length)
    @length = length
    @ship = []
    @shots_fired = []
  end

  def place(x, y, across)
    if @ship.empty?
      if across
        (x...x+@length).each do |place|
          @ship << [place, y]
        end

        ship = Position.new(@ship)
      else
        (y...y+@length).each do |place|
          @ship << [x, place]
        end
        ship = Position.new(@ship)
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

  def fire_at(x,y)
    if @ship.include?([x,y]) && !@shots_fired.include?([x,y])
      @shots_fired << [x,y]
      return true
    end
    false
  end

  def sunk?
    if @ship == @shots_fired && !@ship.empty?
      return true
    end
  end



end
