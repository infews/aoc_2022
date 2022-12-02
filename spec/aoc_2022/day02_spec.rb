RSpec.describe Aoc2022::Day02::RockPaperScissorsPart1 do
  let(:subject) { Aoc2022::Day02::RockPaperScissorsPart1.new(input) }

  context "solve for test data" do
    let(:input) {
      %(A Y
B X
C Z
)
    }
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
        expect(subject.total_score).to eq(14375)
      end
    end
  end
end

RSpec.describe Aoc2022::Day02::RockPaperScissorsPart2 do
  let(:subject) { Aoc2022::Day02::RockPaperScissorsPart2.new(input) }

  context "solve for test data" do
    let(:input) {
      %(A Y
B X
C Z
)
    }
    describe "#total_score" do
      it "solves part II" do
        expect(subject.total_score).to eq(12)
      end
    end
  end

  context "solve for real data" do
    let(:input) { File.read("spec/fixtures/day02.txt") }

    describe "#total_score" do
      it "solves part II" do
        expect(subject.total_score).to eq(10274)
      end
    end
  end
end
