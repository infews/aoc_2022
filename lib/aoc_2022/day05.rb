module Aoc2022
  module Day05
    Move = Struct.new("Move", :count, :from, :to)

    class Crates
      CRATE_NAMES = *("A".."Z")

      def initialize(input)
        stacks, moves = input.split("\n\n")

        @stacks = fill_stacks(stacks.split("\n")[0..-2])
        @moves = fill_moves(moves)
      end

      def tops
        @stacks.collect { |s| s[-1] }.join
      end

      def restack_with_model(crane)
        if crane == 9000
          pop_and_push_all
        else # 9001
          pop_and_push_all { |popped| popped.reverse }
        end
      end

      def pop_and_push_all
        @moves.each do |m|
          popped = @stacks[m.from].pop(m.count)
          popped = yield popped if block_given?
          m.count.times do
            @stacks[m.to].push(popped.pop)
          end
        end
      end

      def fill_stacks(input)
        chars = input.collect { |row| row.chars }
          .transpose

        stack_count = (input.first.size + 1) / 4
        stack_count.times.collect do |i|
          at = (i * 4) + 1
          chars[at].select { |c| CRATE_NAMES.include?(c) }
            .reverse
        end
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
