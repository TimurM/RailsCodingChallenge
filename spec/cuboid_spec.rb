require 'cuboid'

#This test is incomplete and, in fact, won't even run without errors.
#  Do whatever you need to do to make it work and please add your own test cases for as many
#  methods as you feel need coverage
describe Cuboid do

  # describe "move_to" do
  #   it "changes the origin in the simple happy case" do
  #     expect(subject.move_to!(1,2,3)).to be true
  #   end
  # end
  #
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

    it "should move the origin to a new origin" do
      subject.move_to!(3,2,1)
      expect(subject.origin).to eq([3, 2, 1])
    end

  end

end
