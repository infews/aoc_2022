module Aoc2022
  module Day09
    Command = Struct.new(:dir, :count)

    class Position
      MOVE_DIRS = {
        "R" => {x: 1, y: 0},
        "L" => {x: -1, y: 0},
        "U" => {x: 0, y: 1},
        "D" => {x: 0, y: -1}
      }
      attr_reader :x, :y

      def initialize(x, y)
        @x = x
        @y = y
      end

      def move(dir)
        Position.new(x + MOVE_DIRS[dir][:x], y + MOVE_DIRS[dir][:y])
      end

      def move_tail(head)
        new_x = x
        new_y = y

        if head.y == y - 2
          new_x = head.x
          new_y = head.y + 1
        elsif head.y == y + 2
          new_x = head.x
          new_y = head.y - 1
        elsif head.x == x - 2
          new_x = head.x + 1
          new_y = head.y
        elsif head.x == x + 2
          new_x = head.x - 1
          new_y = head.y
        end

        Position.new(new_x, new_y)
      end

      def hash
        to_h.hash
      end

      def to_h
        {x: x, y: y}
      end

      def eql?(other)
        self == other
      end

      def ==(other)
        (self.class == other.class) &&
          (x == other.x) &&
          (y == other.y)
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
              @rope[i] << @rope[i].last.move_tail(previous_knot)
            end
            x = 0 # end of one move
          end
          y = 0 # end of full command
        end
        @rope.last.uniq.size
      end
    end
  end
end
