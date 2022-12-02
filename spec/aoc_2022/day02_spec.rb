RSpec.describe Aoc2022::Day02::RockPaperScissors do
  let(:subject) { Aoc2022::Day02::RockPaperScissors.new(input) }

  context "solve for test data" do
    let(:input) {
      %Q(A Y
B X
C Z
) }
    describe "#total_score" do
      it "solves part I" do
        expect(subject.total_score).to eq(15)
      end

    end
  end

  context "solve for real data" do
    let(:input) { File.read("spec/fixtures/day02.txt") }

    describe "#total_score" do
      it "solves part I" do
        expect(subject.total_score).to eq(15)
      end
    end
  end
end
