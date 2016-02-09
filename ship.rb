class Ship
  attr_reader :length
  def initialize(length)
    @length = length
    @ship = []
  end

  def place(x, y, across)
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

  def covers?(x, y)
    if @ship.include?([x,y])
      true
    else
      false
    end
  end
end
