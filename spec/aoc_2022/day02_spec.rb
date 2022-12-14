RSpec.describe Aoc2022::Day02::RockPaperScissors do
  let(:subject) { Aoc2022::Day02::RockPaperScissors.new(input) }

  let(:test_data) {
    %(A Y
B X
C Z
)
  }

  let(:real_data) { File.read("spec/fixtures/day02.txt") }

  context "Part I" do
    context "with test data" do
      let(:input) { test_data }

      it "solves straight scoring" do
        expect(subject.score(:straight)).to eq(15)
      end
    end

    context "with real data" do
      let(:input) { real_data }

      it "solves straight scoring" do
        expect(subject.score(:straight)).to eq(14375)
      end
    end
  end

  context "Part II" do
    context "with test data" do
      let(:input) { test_data }

      it "solves strategy scoring" do
        expect(subject.score(:strat)).to eq(12)
      end
    end

    context "with real data" do
      let(:input) { real_data }

      it "solves strategy scoring" do
        expect(subject.score(:strat)).to eq(10274)
      end
    end
  end
end
