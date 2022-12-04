require "forwardable"
require "set"

module Aoc2022
  module Day04
    class Cleanup
      def initialize(input)
        @pairs = input.collect { |i| ElfPair.new(i.split(",")) }
      end

      def fully_contained
        @pairs.sum { |p| p.covers? ? 1 : 0 }
      end

      def overlap_count
        @pairs.sum { |p| p.overlapping? ? 1 : 0 }
      end
    end

    class ElfPair
      def initialize(pair)
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
