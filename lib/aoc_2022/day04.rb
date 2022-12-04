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
        l_start, l_end, r_start, r_end = boundaries_from(line)
        @left = l_start..l_end
        @right = r_start..r_end
      end

      def boundaries_from(line)
        line.scan(/\d+/)
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
