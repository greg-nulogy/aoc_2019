# frozen_string_literal: true

require "set"

module Aoc2019
  module Day4
    class Part2
      def run(input)
        minimum_password, maximum_password = input.split("-").map(&:to_i)

        (minimum_password..maximum_password)
          .filter(&method(:has_adjacent_digit_pair))
          .filter(&method(:ascending_digits))
          .count
      end

      def has_adjacent_digit_pair(password)
        ["padding", *password.digits, "padding"]
          .each_cons(4).any? do |a, b, c, d|
          a != b && b == c && c != d
        end
      end

      def ascending_digits(password)
        password.digits.reverse.each_cons(2).all? { |a, b| a <= b }
      end

    end

    input = <<~INPUT
      307237-769058
    INPUT

    if __FILE__ == $0
      answer = Part2.new.run(input)
      puts answer
    end
  end
end
