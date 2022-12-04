RSpec.describe Aoc2022::Day04::Cleanup do
  let(:subject) {
    lines = data.split("\n")
    Aoc2022::Day04::Cleanup.new(lines)
  }

  context "with test data" do
    let(:data) {
      %(2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
)
    }
    it "solves Part I" do
      expect(subject.fully_contained).to eq(2)
    end

    it "solves Part II " do
      expect(subject.overlap_count).to eq(4)
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day04.txt") }

    it "solves Part I" do
      expect(subject.fully_contained).to eq(431)
    end

    it "solves Part II " do
      expect(subject.overlap_count).to eq(823)
    end
  end
end
