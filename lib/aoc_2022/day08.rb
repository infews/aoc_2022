module Aoc2022
  module Day08
    class Forest
      attr_reader :visible
      attr_reader :scenic_score

      def initialize(input)
        @map = input.split("\n").collect do |s|
          s.chars.collect { |c| c.to_i }
        end

        @width = @map.first.size
        @depth = @map.size
        @visible = @width * 2 + @depth * 2 - 4
        @scores = []
        look
        score
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

      def score
        (1..(@depth - 2)).each do |row_index|
          (1..(@width - 2)).each do |col_index|
            current_tree = @map[row_index][col_index]

            top = (row_index - 1).downto(0).collect { |i| @map[i][col_index] }
            left = (col_index - 1).downto(0).collect { |i| @map[row_index][i] }
            bottom = ((row_index + 1)..(@width - 1)).collect { |i| @map[i][col_index] }
            right = @map[row_index][col_index + 1, @depth - col_index]

            a = [top, left, bottom, right].collect do |trees|
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
            end
            @scores << a.inject(:*)
          end
        end
        @scenic_score = @scores.max
      end
    end
  end
end
