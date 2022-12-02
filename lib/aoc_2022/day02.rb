module Aoc2022
  module Day02
    class RockPaperScissorsPart1
      def initialize(input)
        @games = input.split("\n")
          .collect { |line| StraightGame.new(line) }
      end

      def total_score
        @games.sum { |g| g.score }
      end
    end

    class StraightGame
      RESULT = {
        "A X" => :tie, "A Y" => :win, "A Z" => :loss,
        "B X" => :loss, "B Y" => :tie, "B Z" => :win,
        "C X" => :win, "C Y" => :loss, "C Z" => :tie
      }
      PLAY = {"X" => 1, "Y" => 2, "Z" => 3}
      SCORING = {win: 6, loss: 0, tie: 3}

      attr_reader :score

      def initialize(plays)
        result = RESULT[plays]
        @score = PLAY[plays.split(" ").last] + SCORING[result]
      end
    end

    class RockPaperScissorsPart2
      def initialize(input)
        @games = input.split("\n")
          .collect { |line| Game.new(line) }
      end

      def total_score
        @games.sum { |g| g.score }
      end
    end

    class Game
      RESULT = {
        "A X" => 3, "A Y" => 4, "A Z" => 8,
        "B X" => 1, "B Y" => 5, "B Z" => 9,
        "C X" => 2, "C Y" => 6, "C Z" => 7
      }

      attr_reader :score

      def initialize(line)
        @score = RESULT[line]
      end
    end
  end
end
