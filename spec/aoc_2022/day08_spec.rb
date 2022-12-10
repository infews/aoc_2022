RSpec.describe Aoc2022::Day08::Forest do
  let(:subject) { Aoc2022::Day08::Forest.new(data) }

  context "with test data" do
    let(:data) {
      %(30373
25512
65332
33549
35390
)
    }
    it "solves Part I" do
      expect(subject.visible).to eq(21)
    end

    xit "solves Part II " do
      expect(subject.to_delete).to eq(24933642)
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day08.txt") }

    it "solves Part I" do
      expect(subject.visible).to eq(1681)
    end

    xit "solves Part II " do
      expect(subject.to_delete).to eq(2948823)
    end
  end
end
