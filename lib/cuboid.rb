
class Cuboid
  attr_reader :origin, :verticii, :x_max, :y_max, :z_max, :x, :y, :z

  def initialize(origin, l:0, h: 0, w:0)
    @l, @h, @w = l, h, w

    @x, @y, @z = origin[0], origin[1], origin[2]

    @x_max = @x + @l
    @y_max = @y + @h
    @z_max = @z + @w

    @verticii = []

    validate_input!
  end

  def move_to!(x, y, z)
    @x, @y, @z = x, y, z
    validate_input!
    generate_vertices
  end


  def vertices
    generate_vertices if @verticii.empty?
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    (@x <= other.x_max && other.x <= @x_max) &
    (@y <= other.y_max && other.y <= @y_max) &
    (@z <= other.x_max && other.z <= @z_max)
  end

  def origin
    [@x, @y, @z]
  end

  private

  def generate_vertices
    @verticii.clear

    @verticii << [@x, @y, @z]
    @verticii << [@x + @l, @y, @z]
    @verticii << [@x + @l, @y+@h, @z]
    @verticii << [@x, @y+@h, @z]
    @verticii << [@x, @y, @z+@w]
    @verticii << [@x, @y+@h, @z+@w]
    @verticii << [@x+@l, @y+@h, @z+@w]
    @verticii << [@x+@l, @y, @z+@w]
  end

  def validate_input!
    origin = [@x, @y, @z]
    raise ArgumentError.new("Origin must be present") unless (!origin.nil? && origin.length == 3)


    origin.each do |coord|
      if (!coord.is_a?(Integer) || coord < 0)
        raise ArgumentError.new("Origin params must be Integers")
      end
    end

    [@h, @w, @l].each do |side|
      if (!side.is_a?(Integer)  || side <= 0)
        raise ArgumentError.new("Please enter positive integers for length/width/height")
      end
    end
  end
end
