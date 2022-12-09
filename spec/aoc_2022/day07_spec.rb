RSpec.describe Aoc2022::Day07::FileSystem do
  let(:subject) { Aoc2022::Day07::FileSystem.new(data) }

  context "with test data" do
    let(:data) {
      %($ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
)
    }
    it "solves Part I" do
      expect(subject.deleteable).to eq(95437)
    end

    xit "solves Part II " do
      subject.restack_with_model(9001)
      expect(subject.tops).to eq("MCD")
    end
  end

  context "with puzzle data" do
    let(:data) { File.read("spec/fixtures/day07.txt") }

    it "solves Part I" do
      expect(subject.deleteable).to eq(1453349)
    end

    xit "solves Part II " do
      subject.restack_with_model(9001)
      expect(subject.tops).to eq("RMHFJNVFP")
    end
  end
end
