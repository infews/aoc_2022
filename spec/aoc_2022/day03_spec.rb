RSpec.describe Aoc2022::Day03::Baggage do
  let(:subject) {
    lines = data.split("\n")
    Aoc2022::Day03::Baggage.new(lines)
  }

  let(:test_data) {
    %(vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
)
  }

  let(:real_data) { File.read("spec/fixtures/day03.txt") }

  context "Part I" do
    context "with test data" do
      let(:data) { test_data }

      describe "#sum_sack_priority" do
        it "matches" do
          expect(subject.sum_sack_priority).to eq(157)
        end
      end
    end

    context "with real data" do
      let(:data) { real_data }

      describe "#sum_sack_priority" do
        it "matches" do
          expect(subject.sum_sack_priority).to eq(7831)
        end
      end
    end
  end

  context "Part II" do
    context "with test data" do
      let(:data) { test_data }

      describe "#sums" do
        xit "matches" do
          expect(subject.sum).to eq(70)
        end
      end
    end

    context "with real data" do
      let(:data) { real_data }

      describe "#sums" do
        xit "matches" do
          expect(subject.sum).to eq(157)
        end
      end
    end
  end
end
