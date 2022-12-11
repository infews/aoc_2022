module Aoc2022
  module Day09
    Command = Struct.new(:dir, :count)

    class Position
      MOVE_DIRS = {
        "R" => { x: 1, y: 0 },
        "L" => { x: -1, y: 0 },
        "U" => { x: 0, y: 1 },
        "D" => { x: 0, y: -1 }
      }
      attr_reader :x, :y

      def initialize(x, y)
        @x = x
        @y = y
      end

      def move(dir)
        Position.new(x + MOVE_DIRS[dir][:x], y + MOVE_DIRS[dir][:y])
      end

      def move_tail(head, dir)
        return Position.new(0, 0) if at_start(head)

        new_x = x
        new_y = y

        case dir
        when "R"
          if x == head.x - 1
            new_x += 1
            if y == head.y - 1
              new_y += 1
            elsif y == head.y + 1
              new_y -= 1
            end
          end
        when "L"
          if x == head.x + 1
            new_x -= 1
            if y == head.y - 1
              new_y += 1
            elsif y == head.y + 1
              new_y -= 1
            end
          end
        when "U"
          if y == head.y - 1
            new_y += 1
            if x == head.x - 1
              new_x += 1
            elsif x == head.x + 1
              new_x -= 1
            end
          end
        when "D"
          if y == head.y + 1
            new_y -= 1
            if x == head.x - 1
              new_x += 1
            elsif x == head.x + 1
              new_x -= 1
            end
          end
        end
        Position.new(new_x, new_y)
      end

      def hash
        to_h.hash
      end

      def to_h
        { x: x, y: y }
      end

      def eql?(other)
        self == other
      end

      def ==(other)
        (self.class == other.class) &&
          (x == other.x) &&
          (y == other.y)
      end

      def at_start(head)
        (x == 0) && (y == 0) && (self == head)
      end
    end

    class Rope
      def initialize(input, knots)
        @commands = input.split("\n")
                         .collect { |line| line.split(" ") }
                         .collect { |cmd| Command.new(cmd[0], cmd[1].to_i) }
        @rope = knots.times.collect { |i| [Position.new(0, 0)] }
        @head_positions = @rope.first
        @tail_positions = @rope.last
      end

      def tail_positions
        @commands.each do |cmd|
          cmd.count.times do
            head = @head_positions.last
            @head_positions << head.move(cmd.dir)
            @tail_positions << @tail_positions.last.move_tail(head, cmd.dir)
          end
        end

        @tail_positions.uniq.size
      end
    end
  end
end
