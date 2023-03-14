# frozen_string_literal: true

module Aoc2019
  module Day1
    class Part2
      def run(input)
        module_masses = parse_module_masses(input)
        calculate_total_fuel_needs(module_masses)
      end

      private

      def parse_module_masses(input)
        input
          .lines(chomp: true)
          .map(&:to_i)
      end

      def calculate_total_fuel_needs(module_masses)
        module_masses
          .map(&method(:calculate_fuel_mass_required))
          .sum
      end

      def calculate_fuel_mass_required(mass)
        initial_fuel_mass = (mass / 3).floor - 2

        total_fuel_required(initial_fuel_mass)
      end

      def total_fuel_required(initial_fuel_mass)
        if initial_fuel_mass.positive?
          initial_fuel_mass + calculate_fuel_mass_required(initial_fuel_mass)
        else
          0
        end
      end

    end

    if __FILE__ == $0
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

      answer = Part2.new.run(input)
      puts answer
    end
  end
end

