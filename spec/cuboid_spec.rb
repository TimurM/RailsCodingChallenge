require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do
  # describe "intersects?" do
  # end

  describe "initialize a cuboid" do

    it "initilizes a cuboid correctly when all params are valid" do
      cuboid1 = Cuboid.new([0, 0, 0], h:3, w:4, l:5 )
      expect(cuboid1).to be_a Cuboid
    end

    it "raises an error if paremters passed in are invalid dimentions" do

      expect{Cuboid.new([0, 0, 0], h:0, w:4, l:5 )}.to raise_error(ArgumentError)
      expect{Cuboid.new([0, 0, 0], h:3, w:0, l:5 )}.to raise_error(ArgumentError)
      expect{Cuboid.new([0, 0, 0], h:3, w:4, l:0 )}.to raise_error(ArgumentError)
      expect{Cuboid.new([0, 0], h:3, w:4, l:5 )}.to raise_error(ArgumentError)
    end
  end

  describe "move_to!" do

    let(:subject) { Cuboid.new([0, 0, 0], h:3, w:4, l:5 ) }

    it "should stay in place if coordinates do not change" do
      subject.move_to!(0,0,0)
      expect(subject.origin).to eq([0, 0, 0])
    end

    it "should move the origin to a new origin" do
      subject.move_to!(3,2,1)
      expect(subject.origin).to eq([3, 2, 1])
    end
  end

  describe "verticii" do
    let(:subject) { Cuboid.new([0, 0, 0], h:4, w:5, l:1 ) }

    it "should generate valid vertices" do
      valid_vertices = [[0, 0, 0], [1, 0, 0], [1, 4, 0], [0, 4, 0], [0, 0, 5], [0, 4, 5], [1, 4, 5], [1, 0, 5]]

      expect(subject.vertices).to eq(valid_vertices)
    end

    it "should generate valid vertices after a move" do
      valid_vertices = [[1, 2, 3], [2, 2, 3], [2, 6, 3], [1, 6, 3], [1, 2, 8], [1, 6, 8], [2, 6, 8], [2, 2, 8]]
      subject.move_to!(1, 2, 3)
      expect(subject.verticii).to eq(valid_vertices)
    end
  end
end
