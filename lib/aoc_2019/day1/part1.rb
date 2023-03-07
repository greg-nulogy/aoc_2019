# frozen_string_literal: true

module Aoc2019
  module Day1
    class Part1
      def run(input)
        input
          .lines(chomp: true)
          .map(&:to_i)
          .map(&method(:calculate_fuel_required))
          .sum
      end

      def calculate_fuel_required(mass)
        (mass / 3).floor - 2
      end
    end
  end
end

