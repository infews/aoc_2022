require "forwardable"

module Aoc2022
  module Day03
    class Baggage
      def initialize(input)
        @sacks = input.map { |l| Rucksack.new(l.chars) }
        @groups = []
        @sacks.each_slice(3) { |x, y, z| @groups << Group.new([x, y, z]) }
      end

      def sum_sack_priority
        @sacks.sum { |s| priority_of(s.shared) }
      end

      def sum_badge_priority
        @groups.sum { |g| priority_of(g.badge) }
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

    class Group
      def initialize(sacks)
        @sacks = sacks
      end

      def badge
        sack_items = @sacks.first.items
        @sacks.each do |s|
          sack_items &= s.items
        end
        sack_items.first
      end
    end

    class Rucksack
      attr_reader :shared, :items

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
