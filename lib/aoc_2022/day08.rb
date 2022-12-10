module Aoc2022
  module Day08
    class Forest
      attr_reader :visible

      def initialize(input)
        @map = input.split("\n").collect do |s|
          s.chars.collect { |c| c.to_i }
        end

        @width = @map.first.size
        @depth = @map.size
        @visible = @width * 2 + @depth * 2 - 4
        look
      end

      def look
        (1..(@depth - 2)).each do |row_index|
          (1..(@width - 2)).each do |col_index|
            current_tree = @map[row_index][col_index]

            top = (0..(row_index - 1)).collect { |i| @map[i][col_index] }
            left = @map[row_index][0, col_index]
            bottom = (@width - 1).downto(row_index + 1).collect { |i| @map[i][col_index] }
            right = @map[row_index][col_index + 1, @depth - col_index]

            visible = [top, left, bottom, right].collect do |trees|
              trees.all? { |t| t < current_tree }
            end

            @visible += 1 if visible.any?(true)
          end
        end
      end
    end
  end
end
