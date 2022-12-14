module Aoc2022
  module Day11

    class Monkey
      attr_reader :business
      attr_accessor :items

      def initialize(items, operation, ops_value, test_value, monkey_true, monkey_false)
        @items = items
        @operation = operation
        @ops_value = ops_value
        @test_value = test_value
        @monkey_true = monkey_true
        @monkey_false = monkey_false
        @business = 0
      end

      def do_business
        results = []
        @items.each do |item|
          new_worry = calc_worry(item) / 3
          if new_worry % @test_value == 0
            results << { @monkey_true => new_worry }
          else
            results << { @monkey_false => new_worry }
          end
        end
        @business += @items.size
        @items = []
        results
      end

      def calc_worry(old_worry)

        value = (@ops_value == "old") ? old_worry : @ops_value

        case @operation
        when "+"
          old_worry + value
        when "-"
          old_worry - value
        when "*"
          old_worry * value
        when "/"
          old_worry / value
        end
      end

      RE_ITEMS = /items: (?<items>.*)\n/
      RE_TEST = /Test: divisible by (?<test>\d+)\n/
      RE_TRUE = /ue: .*monkey (?<m_true>\d+)\n/
      RE_FALSE = /lse:.*monkey (?<m_false>\d+)/
      RE_3 = /old (?<op>[\/|\+|\*|-])\s(?<val>.*)$/

      def self.from(text_block)

        md = text_block.match RE_ITEMS
        items = md[:items].split(",")
                          .collect { |num| num.to_i }

        md = text_block.match RE_TEST
        test_value = md[:test].to_i
        if test_value == 0
          puts "found at #{md}"
        end

        md = text_block.match RE_TRUE
        monkey_true = md[:m_true].to_i

        md = text_block.match RE_FALSE
        monkey_false = md[:m_false].to_i

        md = text_block.match RE_3
        operation = md[:op]
        ops_value = (md[:val] == "old") ? "old" : md[:val].to_i

        Monkey.new(items, operation, ops_value, test_value, monkey_true, monkey_false)
      end

    end

    class KeepAway
      def initialize(input)
        @monkeys = input.split("\n\n")
                        .collect { |text| Monkey.from(text) }
      end

      def monkey_business
        20.times do
          @monkeys.each do |monkey|
            results = monkey.do_business
            results.each do |result|
              which_monkey = result.keys.first
              @monkeys[which_monkey].items << result[which_monkey]
            end
          end
        end
        @monkeys.collect { |m| m.business }.max(2).inject(:*)
      end
    end
  end
end
