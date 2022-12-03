# DWF's Solutions for Advent of Code 2022

My Ruby solutions for [Advent of Code 2022](https://adventofcode.com)


## Development

```sh
> bundle            # because Ruby
> bundle exec rake  # because TDD
```

Note that I TDD these solutions and there will often be refactors in the history. I attempt to do lots of small checkins on green. The goal is to make the refactoring steps more useful to folks who watch that sort of thing.

I tend to use bundler to set up a base Ruby project with RSpec, hence the `aoc_2022.gemspec` file and the slightly cryptic `Gemfile`.

