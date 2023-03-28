# frozen_string_literal: true

require "aoc_2019/day4/part1"

RSpec.describe Aoc2019::Day4::Part1 do
  subject { Aoc2019::Day4::Part1.new }

  it "can count valid passwords correctly" do
    input = <<~INPUT
      111111-111112
    INPUT
    expect(subject.run(input)).to eq(2)
  end

  it "calculates duplicate adjacent digits" do
    password = 123123
    expect(subject.has_duplicate_adjacent_digit(password)).to be(false)
    end

  it "calculates duplicate adjacent digits" do
    password = 122123
    expect(subject.has_duplicate_adjacent_digit(password)).to be(true)
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
