
class Cuboid
  attr_reader :origin
  
  def initialize(origin, h: 0, w:0, l:0)
    @origin = origin #[h, w, l]
    @h = h
    @w = w
    @l = l

    validate_input!
    # generate_vertices
  end
  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)

  end


  def vertices
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  private

  def generate_vertices(new_x, new_y, new_z)

  end

  def validate_input!
    raise ArgumentError.new("Origin must be present") unless (!@origin.nil? && @origin.length == 3)

    [@h, @w, @l].each do |side|
      if (side <= 0 || !side.is_a?(Integer))
        raise ArgumentError.new("Please enter positive integers for length/width/height")
      end
    end
  end



  #END public methods that should be your starting point
end

#
# cuboid1 = Cuboid.new([0, 0, 0], h:4, w:5, l:1 )
# p cuboid1
