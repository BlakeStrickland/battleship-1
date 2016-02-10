require './ship.rb'
class Grid
  def initialize
    @ships = []
    @hits = []
  end

  def place_ship(ship_object, x, y, across)
    ship_object.place(x, y, across)
    @ships.each do |i|
      if i.overlaps_with?(ship_object)
        return false
      end
    end
    @ships << ship_object
  end

  def has_ship_on?(x,y)
    found = false
    @ships.each do |s|
      found = true if s.covers?(x,y)
    end
    found
  end

  def fire_at(x,y)
    return false if has_ship_on?(x, y)
  end


  def display
    letters = ["A","B","C","D","E","F","G","H","I","J"]
    puts "    1   2   3   4   5   6   7   8   9   10"
    puts "  -----------------------------------------"
    (1..10).each do |y|
      output_row="#{letters[y-1]} |"
      (1..10).each do |x|
        if @hits.include?([x,y])
          output_row += " X |"
        elsif self.has_ship_on?(x,y)
          output_row += " O |"
        else
          output_row += "   |"
        end
      end
      puts output_row
    end
    puts "  -----------------------------------------"
  end

end
