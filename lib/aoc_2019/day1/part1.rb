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

    input = <<~INPUT
      109364
      144584
      87498
      130293
      91960
      117563
      91730
      138879
      144269
      89058
      89982
      115609
      114728
      85422
      111803
      148524
      130035
      107558
      138936
      95622
      58042
      50697
      86848
      123301
      123631
      143125
      76434
      78004
      91115
      89062
      58465
      141127
      139993
      80958
      104184
      145131
      87438
      74385
      102113
      97392
      105986
      58600
      147156
      54377
      61409
      73552
      87138
      63168
      149602
      111776
      113191
      80137
      145985
      145177
      73192
      141631
      132979
      52565
      126574
      92005
      134655
      115894
      89175
      127328
      139873
      50072
      78814
      134750
      120848
      132950
      126523
      58206
      70885
      85482
      70889
      100029
      68447
      95111
      79896
      138650
      83079
      83112
      117762
      57223
      138122
      145193
      85251
      103331
      134501
      77023
      148189
      141341
      75994
      67024
      137767
      86260
      58705
      58771
      60684
      79655
    INPUT

    answer = Part1.new.run(input)
    puts answer
  end
end

