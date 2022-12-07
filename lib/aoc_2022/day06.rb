module Aoc2022
  module Day06
    class SignalDetector
      attr_reader :start_of_packet, :start_of_message

      def initialize(input)
        @signal = input.chars

        @start_of_packet = detect(0, 4)
        @start_of_message = detect(@start_of_packet, 14)
      end

      def detect(start, size)
        found = false
        check_start = start
        check_end = check_start + size-1

        until found
          test = @signal[check_start..check_end]

          if test.size != test.uniq.size
            check_start += 1
          else
            found = true
          end
          check_end += 1
        end
        check_end
      end
    end
  end
end