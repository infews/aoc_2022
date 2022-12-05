module Aoc2022
  module Day05
    Move = Struct.new("Move", :count, :from, :to)

    class Crates
      CRATE_NAMES = *("A".."Z")

      def initialize(input)
        stack_list, move_list = input.split("\n\n")

        @stacks = fill_stacks(stack_list)
        @moves = fill_moves(move_list)

        move
      end

      def tops
        @stacks.collect { |s| s[-1] }.join
      end

      def move
        @moves.each do |m|
          m.count.times {
            @stacks[m.to].push(@stacks[m.from].pop)
          }
        end
      end

      def fill_stacks(stack_list)
        stacks = []
        input_rows = stack_list.split("\n")[0..-2]
        stack_count = (input_rows.first.size + 1) / 4

        chars = input_rows.collect { |row| row.chars }
          .transpose
        stack_count.times do |i|
          at = (i * 4) + 1
          stack = chars[at].select { |c| CRATE_NAMES.include?(c) }
            .reverse
          stacks.push(stack)
        end

        stacks
      end

      def fill_moves(move_list)
        move_list.split("\n").collect do |line|
          md = line.match(/move (\d+) from (\d+) to (\d+)/)
          next if md.nil?
          Move.new(md[1].to_i, md[2].to_i - 1, md[3].to_i - 1)
        end
      end
    end
  end
end
