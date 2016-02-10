require 'byebug'
require './position.rb'
class Ship
  attr_reader :length, :ship
  def initialize(length)
    @length = length
    @ship = []
  end

  def place(x, y, across)
    return false if @ship != []
    length.times do |i|
      @ship << (across ? Position.new(x+i, y) :  Position.new(x, y+i))
    end
  end

  def covers?(x, y)
    if @ship.each do |i|
      return i if i.x == x && i.y == y
      end
    false
    end
  end

  def overlaps_with?(another_ship)
    found = false
    @ship.each do |i|
      found = true if another_ship.covers?(i.x, i.y)
    end
    found
  end

  def fire_at(x,y)
    position = covers?(x, y)
    position && position.hit!
  end

  def sunk?
    return false if @ship.empty?
    @ship.each do |i|
      return false if !i.hit?
    end
    return true
  end
end
