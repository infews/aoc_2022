module Aoc2022
  module Day06
    class SignalDetector
      attr_reader :start_of_packet, :start_of_message

      def initialize(input)
        @signal = input.chars

        detect_marker
        detect_message
      end

      def detect_marker
        found = false
        check_start = 0
        @start_of_packet = 3

        until found
          test = @signal[check_start..@start_of_packet]

          if test.size != test.uniq.size
            check_start += 1
          else
            found = true
          end
          @start_of_packet += 1
        end
      end

      def detect_message
        found = false
        check_start = @start_of_packet
        @start_of_message = check_start + 13

        until found
          test = @signal[check_start..@start_of_message]

          if test.size != test.uniq.size
            check_start += 1
          else
            found = true
          end
          @start_of_message += 1
        end
      end
    end
  end
end
