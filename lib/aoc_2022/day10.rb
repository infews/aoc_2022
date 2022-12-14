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

      def run_signal_test
        process_commands_and_update(:first) do
          @strengths << (@x * @cycle) if record?
        end
      end

      def render(draw = true)
        screen = []
        position = [-1, 0, 1]

        process_commands_and_update(:last) do
          screen << (position.include?(@x) ? "#" : ".")
          if position[2] == 40
            position = [-1, 0, 1]
            screen << "\n"
          else
            position.collect! { |n| n + 1 }
          end
        end

        puts screen.join if draw
      end

      def process_commands_and_update(update, &block)
        @commands.each do |cmd|
          cmd.tick.times do
            if update == :last
              yield
              update_register(cmd)
            else
              update_register(cmd)
              yield
            end
          end
        end
      end

      def update_register(cmd)
        @cycle += 1
        cmd.tick -= 1
        if cmd.tick == 0
          @x += cmd.value
        end
      end

      def signal_strength_sums
        run_signal_test
        @strengths.sum
      end

      def record?
        (@cycle == 20) || ((@cycle - 20) % 40) == 0
      end
    end
  end
end
