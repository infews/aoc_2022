module Aoc2022
  module Day02
    class RockPaperScissors
      SCORING = {
        straight: {
          "A X" => 4, "A Y" => 8, "A Z" => 3,
          "B X" => 1, "B Y" => 5, "B Z" => 9,
          "C X" => 7, "C Y" => 2, "C Z" => 6
        },
        strat: {
          "A X" => 3, "A Y" => 4, "A Z" => 8,
          "B X" => 1, "B Y" => 5, "B Z" => 9,
          "C X" => 2, "C Y" => 6, "C Z" => 7
        }
      }

      def initialize(input)
        @lines = input.split("\n")
      end

      def score(style)
        @lines.sum do |line|
          SCORING[style][line]
        end
      end
    end
  end
end
