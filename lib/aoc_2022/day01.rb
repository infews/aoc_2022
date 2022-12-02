module Aoc2022
  module Day01
    class CalCounter
      attr_reader :elves_load

      def initialize(input)
        @elves_load = input.split("\n\n")
          .collect { |s| s.split("\n") }
          .collect { |l| l.collect { |c| c.to_i } }
      end

      def top(count = 1)
        elves_load.map { |load| load.sum }
          .max(count)
          .sum
      end
    end
  end
end
