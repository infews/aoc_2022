RSpec.describe Aoc2022::Day09::Rope do
  let(:subject) { Aoc2022::Day09::Rope.new(data) }

  context "with test data" do
    let(:data) {
      %(R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
)
    }

    it "equal" do
      a = Aoc2022::Day09::Position.new(0, 0)
      b = Aoc2022::Day09::Position.new(0, 0)
      expect([a, b].uniq.size).to eq(1)
    end

    it "solves Part I" do
      expect(subject.tail_positions).to eq(13)
    end

    xit "solves Part II " do
      expect(subject.scenic_score).to eq(8)
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day09.txt") }

    it "solves Part I" do
      expect(subject.tail_positions).to eq(6236)
    end

    xit "solves Part II " do
      expect(subject.scenic_score).to eq(201684)
    end
  end
end
