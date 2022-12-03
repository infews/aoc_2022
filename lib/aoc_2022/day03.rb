module Aoc2022
  module Day03
    class Baggage
      def initialize(input)
        @sacks = input.map { |l| Rucksack.new(l.chars) }
      end

      def sum_sack_priority
        @sacks.sum { |s| priority_of(s.shared) }
      end

      def sum_badge_priority
        0
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
      attr_reader :shared

      def initialize(chars)
        @items = chars
        @shared = find_shared
      end

      def find_shared
        first, second = @items.each_slice((@items.size / 2.0).round).to_a
        f = first.uniq
        s = second.uniq
        (f - (f - s)).first
      end
    end
  end
end
