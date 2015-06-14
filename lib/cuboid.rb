
class Cuboid
  attr_reader :origin, :verticii

  def initialize(origin, h: 0, w:0, l:0)
    @origin = origin #[h, w, l]
    @h = h
    @w = w
    @l = l
    @verticii = []
    validate_input!
  end
  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
    @origin = [x, y, z]
    generate_vertices
  end


  def vertices
    generate_vertices if @verticii.empty?
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  private

  def generate_vertices
    @verticii.clear
    x = origin[0]
    y = origin[1]
    z = origin[2]

    @verticii << [x, y, z]
    @verticii << [x + @l, y, z]
    @verticii << [x + @l, y+@h, z]
    @verticii << [x, y+@h, z]
    @verticii << [x, y, z+@w]
    @verticii << [x, y+@h, z+@w]
    @verticii << [x+@l, y+@h, z+@w]
    @verticii << [x+@l, y, z+@w]

  end

  def validate_input!
    raise ArgumentError.new("Origin must be present") unless (!@origin.nil? && @origin.length == 3)

    [@h, @w, @l].each do |side|
      if (side <= 0 || !side.is_a?(Integer))
        raise ArgumentError.new("Please enter positive integers for length/width/height")
      end
    end
  end
end

# #
# cuboid1 = Cuboid.new([1, 2, 3], h:4, w:5, l:1 )
#
# # cuboid1.vertices
# # cuboid1.move_to!(1, 2, 3)
# cuboid1.vertices
# p cuboid1.verticii
