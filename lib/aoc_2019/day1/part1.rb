# frozen_string_literal: true

module Aoc2019
  module Day1
    class Part1
      def run(input)
        masses = parse_module_masses(input)
        fuel_required = calculate_fuel_required(masses)

        fuel_required.sum
      end

      private

      def parse_module_masses(input)
        input
          .lines(chomp: true)
          .map(&:to_i)
      end

      def calculate_fuel_required(masses)
        masses.map { |mass| (mass / 3).floor - 2 }
      end
    end
  end
end

