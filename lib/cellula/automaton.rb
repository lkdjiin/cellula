module Cellula

  # Public: This class provides all it's needed to run a cellular
  # automaton.
  #
  # You rarely wants to initialize an Automaton directly. This is
  # because Automaton's creation needs a lots of parameters. It is
  # much more simpler to create Automata using AutomatonBuilder class.
  #
  # TODO Document rule.
  class Automaton

    # Public: Initialize a new Automaton.
    #
    # name        - String name of the automaton.
    # dimensions  - Integer number of dimensions for the automaton's
    #               grid. Default is 1.
    # type        - Currently only :elementary.
    # width       - The Integer width of the automaton's grid.
    # rule_number - Rule of the automaton. TODO write more about the types.
    #               Currently rule is a Symbol.
    def initialize(name, dimensions, type, width, rule_number)
      @name = name
      @dimensions = dimensions
      @type = type
      @width = width
      @rule = Rule.new(rule_number)
      @grid = Array.new(@width)
      @grid.map! {|item| rand(2) }
    end

    # Public: Get the String name of the automaton.
    attr_reader :name

    # Public: Set/get the Integer dimensions of the automaton's grid.
    attr_accessor :dimensions

    # Public: Set/get the Symbol type of the automaton.
    attr_accessor :type

    # Public: Set/get the Integer width of the automaton's grid.
    attr_accessor :width

    # Public: Get the rule of the automaton.
    attr_reader :rule

    # Public: Generate successive generations of this automaton.
    #
    # total_generations - Integer number of generations to produce.
    #                     If, for example, `total_generations == 4` then
    #                     #generate will produce 5 generations: The
    #                     original generation plus the four you want.
    # block             - What to do with a generation.
    #
    # Example
    #
    #    automaton.generate(10) do |num, generation|
    #      printf "Gen %4s: %s\n", num, generation.join()
    #    end
    #    # => will result in something like that:
    #    # => Gen    0: 0101001010001011000001000100000100101011
    #    # => Gen    1: 0000010000010000000010001000001001000000
    #    # => Gen    2: 0000100000100000000100010000010010000000
    #    # => Gen    3: 0001000001000000001000100000100100000000
    #    # => Gen    4: 0010000010000000010001000001001000000000
    #
    # Returns successive generations as Array.
    def generate(total_generations, &block)
      block.call(0, @grid)
      1.upto(total_generations) do |i|
        apply_rule
        block.call(i, @grid)
      end
    end

    private

    # Apply rule to the entire grid. @grid becomes the next generation.
    #
    # Returns nothing.
    def apply_rule
      next_grid = @grid.map.with_index do |cell, i|
        @rule.apply_rule(i, @grid)
      end
      @grid = next_grid
    end

  end
end
