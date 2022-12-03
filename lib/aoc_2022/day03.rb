require "forwardable"
require "set"

module Aoc2022
  module Day03
    class Baggage
      def initialize(input)
        @sacks = input.collect { |l| Rucksack.new(l.chars) }
        @groups = @sacks.each_slice(3)
          .collect { |a| Group.new(a) }
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
        @sacks.reduce(:&).to_a.first
      end
    end

    class Rucksack
      include Enumerable
      extend Forwardable

      def_delegators :items, :&, :each
      attr_reader :shared, :items

      def initialize(chars)
        @items = Set.new(chars)
        @shared = find_shared(chars)
      end

      def find_shared(chars)
        first, second = chars.each_slice(chars.size / 2).to_a
        f = Set.new(first)
        s = Set.new(second)
        (f & s).to_a.first
      end
    end
  end
end
