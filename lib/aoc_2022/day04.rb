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
        pair = line.split(",")
        @left = range_from(pair.first)
        @right = range_from(pair.last)
      end

      def range_from(a)
        nums = a.split("-")
        Range.new(nums.first.to_i, nums.last.to_i)
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
