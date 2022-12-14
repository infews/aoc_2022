module Aoc2022
  module Day10
    Command = Struct.new(:instruction, :value, :tick) do |klass|
      def self.from(instruction, value)
        tick = (instruction == "addx") ? 2 : 1
        value = 0 if value.nil?
        Command.new(instruction, value, tick)
      end
    end

    class CommDevice
      def initialize(input)
        @commands = input.split("\n")
          .collect { |line| line.split(" ") }
          .collect { |cmd| Command.from(cmd[0], cmd[1].to_i) }
        @x = 1
        @cycle = 1
        @strengths = []
      end

      def render(draw = true)
        screen = []
        position = [-1, 0, 1]
        @commands.each do |cmd|
          until cmd.tick == 0
            screen << if position.include?(@x)
              "#"
            else
              "."
            end
            update_register(cmd)
            if position[2] == 40
              position = [-1, 0, 1]
            else
              position[0] += 1
              position[1] += 1
              position[2] += 1
            end
          end
        end

        x = 0
        6.times do
          puts screen[x..(x + 39)].join
          x += 40
        end
        true
      end

      def update_register(cmd)
        @cycle += 1
        cmd.tick -= 1
        @x += cmd.value if cmd.tick == 0
      end

      def run_signal_test
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
        run_signal_test
        @strengths.sum
      end
    end
  end
end
