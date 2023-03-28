# frozen_string_literal: true

require "aoc_2019/day4/part2"

RSpec.describe Aoc2019::Day4::Part2 do
  subject { Aoc2019::Day4::Part2.new }

  it "can count valid passwords correctly" do
    input = <<~INPUT
      112233-112234
    INPUT
    expect(subject.run(input)).to eq(2)
  end

  it "calculates duplicate adjacent digits" do
    password = 123123
    expect(subject.has_adjacent_digit_pair(password)).to be(false)
    end

  it "calculates duplicate adjacent digits" do
    password = 122123
    expect(subject.has_adjacent_digit_pair(password)).to be(true)
  end

  it "finds a double not in a bigger group" do
    password = 123444
    expect(subject.has_adjacent_digit_pair(password)).to be(false)
  end

  it "recognizes ascending digits" do
    password = 123456
    expect(subject.ascending_digits(password)).to be(true)
    end

  it "recognizes non-ascending digits" do
    password = 123256
    expect(subject.ascending_digits(password)).to be(false)
  end

end
