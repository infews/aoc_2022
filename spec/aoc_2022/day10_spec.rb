RSpec.describe Aoc2022::Day10::Comm do
  let(:subject) { Aoc2022::Day10::Comm.new(data) }

  context "with test data" do
    let(:data) { File.read("spec/fixtures/day10_test.txt") }

    it "solves Part I" do
      expect(subject.signal_strength_sums).to eq(13140)
    end

    xit "solves Part II " do
      expect(subject.scenic_score).to eq(8)
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day10.txt") }

    it "solves Part I" do
      expect(subject.signal_strength_sums).to eq(14780)
    end

    xit "solves Part II " do
      expect(subject.scenic_score).to eq(201684)
    end
  end
end
