module Aoc2022
  module Day08
    class Forest
      def initialize(input)
        @map = input.split("\n").collect do |s|
          s.chars.collect { |c| c.to_i }
        end

        @width = @map.first.size
        @depth = @map.size
      end

      def visible
        visible = @width * 2 + @depth * 2 - 4

        two_d_loop do |row, col|
          current_tree = @map[row][col]

          top = (0..(row - 1)).collect { |i| @map[i][col] }
          left = @map[row][0, col]
          bottom = (@width - 1).downto(row + 1).collect { |i| @map[i][col] }
          right = @map[row][col + 1, @depth - col]

          seen = [top, left, bottom, right].collect do |trees|
            trees.all? { |t| t < current_tree }
          end

          visible += 1 if seen.any?(true)
        end
        visible
      end

      def scenic_score
        scores = []
        two_d_loop do |row, col|
          current_tree = @map[row][col]

          top = (row - 1).downto(0).collect { |i| @map[i][col] }
          left = (col - 1).downto(0).collect { |i| @map[row][i] }
          bottom = ((row + 1)..(@width - 1)).collect { |i| @map[i][col] }
          right = @map[row][col + 1, @depth - col]

          scores << [top, left, bottom, right].collect do |trees|
            count_remaining_trees = true
            trees.collect do |tree|
              if (tree < current_tree) && count_remaining_trees
                1
              elsif (tree >= current_tree) && count_remaining_trees
                count_remaining_trees = false
                1
              else
                count_remaining_trees = false
                0
              end
            end.sum
          end.inject(:*)
        end
        scores.max
      end

      def two_d_loop
        (1..(@depth - 2)).each do |row|
          (1..(@width - 2)).each do |col|
            yield row, col
          end
        end
      end
    end
  end
end
