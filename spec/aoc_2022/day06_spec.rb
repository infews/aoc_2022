RSpec.describe Aoc2022::Day06::SignalDetector do
  let(:subject) { Aoc2022::Day06::SignalDetector.new(data) }

  context "with test data" do
    context "example 1" do
      let(:data) { "mjqjpqmgbljsphdztnvjfqwrcgsmlb" }

      it"solves Part I" do
        expect(subject.start_of_packet).to eq(7)
      end

      xit"solves Part II" do
        expect(subject.start_of_message).to eq(19)
      end
    end

    context "example 2" do
      let(:data) { "bvwbjplbgvbhsrlpgdmjqwftvncz" }

      it"solves Part I" do
        expect(subject.start_of_packet).to eq(5)
      end

      it"solves Part II" do
        expect(subject.start_of_message).to eq(23)
      end
    end

    context "example 3" do
      let(:data) { "nppdvjthqldpwncqszvftbrmjlhg" }

      it"solves Part I" do
        expect(subject.start_of_packet).to eq(6)
      end

      it"solves Part II" do
        expect(subject.start_of_message).to eq(23)
      end
    end

    context "example 4" do
      let(:data) { "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" }

      it"solves Part I" do
        expect(subject.start_of_packet).to eq(10)
      end

      it"solves Part II" do
        expect(subject.start_of_message).to eq(29)
      end
    end

    context "example 5" do
      let(:data) { "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" }

      it"solves Part I" do
        expect(subject.start_of_packet).to eq(11)
      end

      it"solves Part II" do
        expect(subject.start_of_message).to eq(26)
      end
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day06.txt") }

    it"solves Part I" do
      expect(subject.start_of_packet).to eq(1647)
    end

    it"solves Part II" do
      expect(subject.start_of_message).to eq(2447)
    end
  end
end
