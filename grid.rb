require './ship.rb'
class Grid
  def initialize
    @ships = []
    @hits = []
  end

  def place_ship(ship_object, x, y, across)
    ship_object.place(x,y,across)
    @ships.each do |s|
      if ship_object.overlaps_with?(s)
        return false
      end
    end
    @ships << ship_object
  end

  def has_ship_on?(x,y)
    @ships.each do |s|
      return true if s.covers?(x,y)
    end
    false
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
