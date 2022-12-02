
RSpec.describe Aoc2022::Day01::CalCounter do
  let(:subject) { Aoc2022::Day01::CalCounter.new(input) }

  context "solve for test data" do
    let(:input) {
      %Q(1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
)
    }
    describe "#max_calories" do
      it "solves part I" do
        expect(subject.top).to eq(24000)
      end

      it "solves part II" do
        expect(subject.top(3)).to eq(45000)
      end
    end
  end

  context "solve for real data" do
    let(:input) {
      File.read("spec/fixtures/day01.txt")
    }
    describe "#max_calories" do
      it "solves part I" do
        expect(subject.top).to eq(71124)
      end

      it "solves part II" do
        expect(subject.top(3)).to eq(204639)
      end
    end
  end
end
