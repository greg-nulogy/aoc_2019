# frozen_string_literal: true

require "set"

module Aoc2019
  module Day4
    class Part1
      def run(input)
        minimum_password, maximum_password = input.split("-").map(&:to_i)

        (minimum_password..maximum_password)
          .filter(&method(:has_duplicate_adjacent_digit))
          .filter(&method(:ascending_digits))
          .count
      end

      def has_duplicate_adjacent_digit(password)
        password.digits.each_cons(2).any? { |a, b| a == b }
      end

      def ascending_digits(password)
        password.digits.reverse.each_cons(2).all? { |a, b| a <= b }
      end

    end

    input = <<~INPUT
      307237-769058
    INPUT

    if __FILE__ == $0
      answer = Part1.new.run(input)
      puts answer
    end
  end
end
