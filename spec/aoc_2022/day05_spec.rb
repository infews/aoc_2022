RSpec.describe Aoc2022::Day05::Crates do
  let(:subject) { Aoc2022::Day05::Crates.new(data) }

  context "with test data" do
    let(:data) {
      %(    [D]....
[N] [C]....
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
)
    }
    it "solves Part I" do
      subject.move_9000
      expect(subject.tops).to eq("CMZ")
    end

    it "solves Part II " do
      subject.move_9001
      expect(subject.tops).to eq("MCD")
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day05.txt") }

    it "solves Part I" do
      subject.move_9000
      expect(subject.tops).to eq("TQRFCBSJJ")
    end

    it "solves Part II " do
      subject.move_9001
      expect(subject.tops).to eq("RMHFJNVFP")
    end
  end
end
