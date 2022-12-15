RSpec.describe Aoc2022::Day11::KeepAway do
  let(:subject) { Aoc2022::Day11::KeepAway.new(data) }

  context "with test data" do
    let(:data) {
      %(Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
)
    }
    it "solves Part I" do
      expect(subject.monkey_business).to eq(10605)
    end

    it "solves Part II " do
      expect(subject.mb_10k).to eq(2713310158)
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day11.txt") }

    it "solves Part I" do
      expect(subject.monkey_business).to eq(57348)
    end

    it "solves Part II " do
      expect(subject.mb_10k).to eq(2713310158)
    end
  end
end
