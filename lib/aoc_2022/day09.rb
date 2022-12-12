module Aoc2022
  module Day09
    Command = Struct.new(:dir, :count)

    class Position < Hash
      MOVE_DIRS = {
        "R" => {x: 1, y: 0},
        "L" => {x: -1, y: 0},
        "U" => {x: 0, y: 1},
        "D" => {x: 0, y: -1}
      }

      def initialize(x, y)
        self[:x] = x
        self[:y] = y
      end

      def x
        self[:x]
      end

      def y
        self[:y]
      end

      def move(dir)
        Position.new(x + MOVE_DIRS[dir][:x], y + MOVE_DIRS[dir][:y])
      end

      def move_to(knot)
        new_x = x
        new_y = y

        if (knot.x == x + 2) && (knot.y == y + 2)
          new_x = knot.x - 1
          new_y = knot.y - 1
        elsif (knot.x == x - 2) && (knot.y == y + 2)
          new_x = knot.x + 1
          new_y = knot.y - 1
        elsif (knot.x == x + 2) && (knot.y == y - 2)
          new_x = knot.x - 1
          new_y = knot.y + 1
        elsif (knot.x == x - 2) && (knot.y == y - 2)
          new_x = knot.x + 1
          new_y = knot.y + 1
        elsif knot.y == y - 2
          new_x = knot.x
          new_y = knot.y + 1
        elsif knot.y == y + 2
          new_x = knot.x
          new_y = knot.y - 1
        elsif knot.x == x - 2
          new_x = knot.x + 1
          new_y = knot.y
        elsif knot.x == x + 2
          new_x = knot.x - 1
          new_y = knot.y
        end

        Position.new(new_x, new_y)
      end
    end

    class Rope
      def initialize(input, knots)
        @commands = input.split("\n")
          .collect { |line| line.split(" ") }
          .collect { |cmd| Command.new(cmd[0], cmd[1].to_i) }
        @rope = knots.times.collect { |i| [Position.new(0, 0)] }
      end

      def tail_positions
        @commands.each do |cmd|
          cmd.count.times do
            @rope[0] << @rope[0].last.move(cmd.dir)
            (1..(@rope.size - 1)).each do |i|
              previous_knot = @rope[i - 1].last
              @rope[i] << @rope[i].last.move_to(previous_knot)
            end
          end
        end
        @rope.last.uniq.size
      end
    end
  end
end