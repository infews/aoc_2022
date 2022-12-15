module Aoc2022
  module Day11
    class Monkey
      attr_reader :business
      attr_accessor :items
      attr_reader :test_value

      def initialize(items, operation, ops_value, test_value, monkey_true, monkey_false)
        @items = items
        @ops_value = ops_value
        @test_value = test_value
        @monkey_true = monkey_true
        @monkey_false = monkey_false
        @business = 0

        @worry_calc = if operation == "+"
                        proc { |worry, value| worry + value }
                      else
                        proc { |worry, value| worry * value }
                      end
      end

      def do_business(worry_relief, lcm)
        results = []
        @items.each do |item|
          worry = @worry_calc.call(item, ops_value(item)) / worry_relief
          worry = worry % lcm
          results << if (worry % @test_value) == 0
                       [@monkey_true, worry]
                     else
                       [@monkey_false, worry]
                     end
        end
        @business += @items.size
        @items = []
        results
      end

      def ops_value(worry_value)
        (@ops_value == "old") ? worry_value : @ops_value
      end

      def self.from(text_block)
        md = text_block.match(/items: (?<items>.*)\n/)
        items = md[:items].split(",")
                          .collect { |num| num.to_i }

        md = text_block.match(/Test: divisible by (?<test>\d+)\n/)
        test_value = md[:test].to_i

        md = text_block.match(/ue: .*monkey (?<m_true>\d+)\n/)
        monkey_true = md[:m_true].to_i

        md = text_block.match(/lse:.*monkey (?<m_false>\d+)/)
        monkey_false = md[:m_false].to_i

        md = text_block.match(/old (?<op>[\/|+*-])\s(?<val>.*)$/)
        operation = md[:op]
        ops_value = (md[:val] == "old") ? "old" : md[:val].to_i

        Monkey.new(items, operation, ops_value, test_value, monkey_true, monkey_false)
      end
    end

    class KeepAway
      def initialize(input)
        @monkeys = input.split("\n\n")
                        .collect { |text| Monkey.from(text) }

        @lcm = @monkeys.collect { |monkey| monkey.test_value }
                       .reduce(1, :lcm)
      end

      def monkey_business(rounds = 20, worry_relief = 3)
        rounds.times do
          @monkeys.each do |monkey|
            monkey.do_business(worry_relief, @lcm).each do |caught|
              which, item = caught
              @monkeys[which].items << item
            end
          end
        end
        @monkeys.collect { |m| m.business }.max(2).inject(:*)
      end

      def mb_10k
        monkey_business(10000, 1)
      end
    end
  end
end
