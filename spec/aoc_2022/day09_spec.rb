RSpec.describe Aoc2022::Day09::Rope do
  let(:subject) { Aoc2022::Day09::Rope.new(data, knots) }

  context "Part I" do
    let(:knots) { 2 }
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

      it "solves" do
        expect(subject.tail_positions).to eq(13)
      end
    end

    context "with puzzle data" do
      let(:data) { File.read("spec/fixtures/day09.txt") }
      it "solves" do
        expect(subject.tail_positions).to eq(6236)
      end
    end
  end

  context "Part II" do
    let(:knots) { 10 }
    context "with initial test data" do
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

      it "solves" do
        expect(subject.tail_positions).to eq(1)
      end
    end

    context "with second test data" do
      let(:data) {
        %(R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
)
      }

      it "solves" do
        expect(subject.tail_positions).to eq(36)
      end
    end

    context "with puzzle data" do
      let(:data) { File.read("spec/fixtures/day09.txt") }

      it "solves" do
        expect(subject.tail_positions).to eq(2449)
      end
    end
  end
end
