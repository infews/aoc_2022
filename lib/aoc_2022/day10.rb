module Aoc2022
  module Day10
    Command = Struct.new(:instruction, :value) do |klass|
      def tick
        (instruction == "addx") ? 2 : 1
      end
    end

    class Comm
      def initialize(input)
        @commands = input.split("\n")
          .collect { |line| line.split(" ") }
          .collect { |cmd| Command.new(cmd[0], cmd[1].to_i) }
        @x = 1
        @cycle = 1
        @strengths = []
        run
      end

      def run
        @commands.each_with_index do |cmd, i|
          cycle = record_at(cmd.tick)
          if cycle > 0
            @strengths << (@x * cycle)
          end
          break if @cycle >= 220
          @cycle += cmd.tick
          @x += cmd.value
        end
      end

      def record_at(tick)
        if (@cycle == 20) || (@cycle + tick == 21)
          return 20
        end

        if ((@cycle - 20) % 40) == 0
          return @cycle
        end

        about_to_record = (((@cycle + tick - 20) % 40) == 1)

        if about_to_record
          return @cycle + 1
        end

        0
      end

      def signal_strength_sums
        @strengths.sum
      end
    end
  end
end
