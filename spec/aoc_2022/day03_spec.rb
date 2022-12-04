RSpec.describe Aoc2022::Day03::Baggage do
  let(:subject) {
    lines = data.split("\n")
    Aoc2022::Day03::Baggage.new(lines)
  }

  context "with test data" do
    let(:data) {
      %(vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
)
    }
    it "solves Part I" do
      expect(subject.sum_sack_priority).to eq(157)
    end

    it "solves Part II " do
      expect(subject.sum_badge_priority).to eq(70)
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day03.txt") }

    it "solves Part I" do
      expect(subject.sum_sack_priority).to eq(7831)
    end

    it "solves Part II " do
      expect(subject.sum_badge_priority).to eq(2683)
    end
  end
end
