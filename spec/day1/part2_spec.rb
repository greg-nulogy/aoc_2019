# frozen_string_literal: true

require "aoc_2019/day1/part2"

RSpec.describe Aoc2019::Day1::Part2 do
  subject { Aoc2019::Day1::Part2.new }
  it "should return 2 for a mass of 12" do
    expect(subject.run("12")).to eq(2)
  end

  it "should return 2 for a mass of 14" do
    expect(subject.run("14")).to eq(2)
  end

  it "should return 966 for a mass of 1969" do
    expect(subject.run("1969")).to eq(966)
  end

  it "should return the sum of fuel for a list of modules" do
    expect(subject.run("12\n14")).to eq(4)
  end
end
