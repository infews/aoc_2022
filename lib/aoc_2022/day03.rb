module Aoc2022
  module Day03
    class Baggage
      def initialize(input)
        @sacks = input.map { |l| Rucksack.from(l.chars) }
      end

      def sum
        @sacks.sum { |s| priority_of(s.shared) }
      end

      def priority_of(item)
        ord = item.ord
        if (97..122).cover?(ord)
          ord - 96
        elsif (65..90).cover?(ord)
          ord - 38
        end
      end
    end

    class Rucksack
      def self.from(line)
        first, second = line.each_slice((line.size / 2.0).round).to_a
        Rucksack.new(first, second)
      end

      attr_reader :shared

      def initialize(first, second)
        f = first.uniq
        s = second.uniq
        @shared = (f - (f - s)).first
      end
    end
  end
end
