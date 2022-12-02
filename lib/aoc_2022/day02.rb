module Aoc2022
  module Day02
    class RockPaperScissors

      def initialize(input)
        @games = input.split("\n")
                      .collect do |line|
          Game.new(*line.split(" "))
        end
      end

      def total_score
        @games.sum { |g| g.score }
      end
    end

    class Game
      PLAY_SCORING = {
        "A" => 1, "B" => 2, "C" => 3,
        "X" => 1, "Y" => 2, "Z" => 3
      }

      def initialize(first, second)
        @first = PLAY_SCORING[first]
        @second = PLAY_SCORING[second]
      end

      def score
        @second +
          if @first < @second
            6
          elsif @first > @second
            0
          else
            @second
          end
      end
    end
  end
end
