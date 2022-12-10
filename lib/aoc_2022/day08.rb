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
        i_width = @width - 2
        i_depth = @depth - 2

        (1..i_depth).each do |row_index|
          (1..i_width).each do |col_index|
            current_tree = @map[row_index][col_index]
            # top
            visible = true
            (0..(row_index - 1)).each do |i|
              if current_tree <= @map[i][col_index]
                visible = false
                break
              end
            end
            if visible
              @visible += 1
              next
            end
            # left
            visible = true
            (0..(col_index - 1)).each do |i|
              if current_tree <= @map[row_index][i]
                visible = false
                break
              end
            end
            if visible
              @visible += 1
              next
            end
            # bottom
            visible = true
            (@width - 1).downto(row_index + 1).each do |i|
              if current_tree <= @map[i][col_index]
                visible = false
                break
              end
            end
            if visible
              @visible += 1
              next
            end
            # right
            visible = true
            (@depth - 1).downto(col_index + 1).each do |i|
              if current_tree <= @map[row_index][i]
                visible = false
                break
              end
            end
            if visible
              @visible += 1
              next
            end
          end
        end
      end
    end
  end
end
