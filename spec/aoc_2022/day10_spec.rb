RSpec.describe Aoc2022::Day10 do
  describe Aoc2022::Day10::CommDevice do
    let(:subject) { Aoc2022::Day10::CommDevice.new(data) }

    context "with test data" do
      let(:data) { File.read("spec/fixtures/day10_test.txt") }

      it "solves Part I" do
        expect(subject.signal_strength_sums).to eq(13140)
      end
    end

    context "with puzzle data" do
      let(:data) { File.read("spec/fixtures/day10.txt") }

      it "solves Part I" do
        expect(subject.signal_strength_sums).to eq(14780)
      end

      it "renders Part II" do
        expect(subject.render(false)).to eq(nil)
      end
    end
  end
end
