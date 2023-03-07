# frozen_string_literal: true

require "aoc_2019/day1/part1"

RSpec.describe Aoc2019::Day1::Part1 do
  subject { Aoc2019::Day1::Part1.new }
  it "should return 2 for a mass of 12" do
    expect(subject.run("12")).to eq(2)
  end

  it "should return 2 for a mass of 14" do
    expect(subject.run("14")).to eq(2)
  end

  it "should return 654 for a mass of 1969" do
    expect(subject.run("1969")).to eq(654)
  end

  it "should return the sum of fuel for a list of modules" do
    expect(subject.run("12\n14")).to eq(4)
  end
end
