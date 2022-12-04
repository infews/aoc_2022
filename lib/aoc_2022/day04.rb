module Aoc2022
  module Day04
    class Cleanup
      def initialize(input)
        @pairs = input.collect { |line| ElfPair.new(line) }
      end

      def fully_contained
        @pairs.count { |p| p.covers? }
      end

      def overlap_count
        @pairs.count { |p| p.overlapping? }
      end
    end

    class ElfPair
      def initialize(line)
        left_start, left_end, right_start, right_end = ranges_from(line)
        @left = left_start..left_end
        @right = right_start..right_end
      end

      def ranges_from(line)
        line.split(",")
          .collect { |s| s.split("-") }
          .flatten
          .collect { |s| s.to_i }
      end

      def covers?
        @left.cover?(@right) || @right.cover?(@left)
      end

      def overlapping?
        @left.cover?(@right.first) || @right.cover?(@left.first)
      end
    end
  end
end
