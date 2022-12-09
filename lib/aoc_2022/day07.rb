module Aoc2022
  module Day07
    class FileSystem
      attr_reader :children

      def initialize(input)
        @commands = input.split("\n")
        @dir_sizes = {}
        parse_commands(self)
      end

      def deleteable
        @dir_sizes.select { |k, v| v <= 100000 }
          .values
          .sum
      end

      def parse_commands(parent)
        dir_names = ["/"]
        @dir_sizes["/"] = 0

        @commands.each_with_index do |cmd, i|
          # is file?
          if (md = cmd.match(/^(?<size>\d+)\s(?<name>\w+)/))
            dir_names.each_with_index do |dir, i|
              path = dir_names[0..i].join("/")
              @dir_sizes[path] += md[:size].to_i
            end
          elsif (md = cmd.match(/\$ cd (?<name>\w+)/))
            dir_names.push(md[:name])
            @dir_sizes[dir_names.join("/")] = 0
          elsif cmd == "$ cd .."
            dir_names.pop
          end
        end
      end
    end
  end
end
