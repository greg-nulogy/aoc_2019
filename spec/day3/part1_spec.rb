# frozen_string_literal: true

require "aoc_2019/day3/part1"

RSpec.describe Aoc2019::Day3::Part1 do
  subject { Aoc2019::Day3::Part1.new }

  it "should return 6 for example 1" do
    input = <<~INPUT
      R8,U5,L5,D3
      U7,R6,D4,L4
    INPUT
    expect(subject.run(input)).to eq(6)
  end

  it "should return 159 for example 2" do
    input = <<~INPUT
      R75,D30,R83,U83,L12,D49,R71,U7,L72
      U62,R66,U55,R34,D71,R55,D58,R83
    INPUT
    expect(subject.run(input)).to eq(159)
  end

  it "should return 135 for example 3" do
    input = <<~INPUT
      R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
      U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
    INPUT
    expect(subject.run(input)).to eq(135)
  end

end
