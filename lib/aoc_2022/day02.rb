module Aoc2022
  module Day02
    class RockPaperScissors
      def initialize(input)
        @lines = input.split("\n")
      end

      def straight_score
        @games = @lines.collect { |line| StraightGame.new(line) }

        @games.sum { |g| g.score }
      end

      def strat_score
        @games = @lines.collect { |line| StratGame.new(line) }
        @games.sum { |g| g.score }
      end
    end

    class StraightGame
      STRAIGHT_RESULT = {
        "A X" => 4, "A Y" => 8, "A Z" => 3,
        "B X" => 1, "B Y" => 5, "B Z" => 9,
        "C X" => 7, "C Y" => 2, "C Z" => 6
      }

      attr_reader :score

      def initialize(line)
        @score = STRAIGHT_RESULT[line]
      end
    end

    class StratGame
      STRAT_RESULT = {
        "A X" => 3, "A Y" => 4, "A Z" => 8,
        "B X" => 1, "B Y" => 5, "B Z" => 9,
        "C X" => 2, "C Y" => 6, "C Z" => 7
      }

      attr_reader :score

      def initialize(line)
        @score = STRAT_RESULT[line]
      end
    end
  end
end
