# frozen_string_literal: true

require "aoc_2019/day2/part1"

RSpec.describe Aoc2019::Day2::Part1 do
  subject { Aoc2019::Day2::Part1.new }
  it "should return 2 for a mass of 12" do
    expect(subject.run("12")).to eq(2)
  end

end
