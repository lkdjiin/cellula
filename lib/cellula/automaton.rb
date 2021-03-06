module Cellula

  # Public: This class provides all it's needed to run a cellular
  # automaton.
  #
  # You rarely wants to initialize an Automaton directly. This is
  # because Automaton's creation needs a lots of parameters. It is
  # much more simpler to create Automata using AutomatonBuilder class.
  #
  # Dimensions
  # ----------
  # Currently only support 1D cellular automata.
  #
  # Type of automaton
  # -----------------
  # Currently only support elementary cellular automaton. Quoted from
  # Wikipedia:
  #
  # an elementary cellular automaton is a one-dimensional cellular
  # automaton where there are two possible states (labeled 0 and 1)
  # and the rule to determine the state of a cell in the next generation
  # depends only on the current state of the cell and its two immediate
  # neighbors. 
  #
  # See http://en.wikipedia.org/wiki/Elementary_cellular_automaton
  # for more details.
  #
  # Rule
  # ----
  # Currently support only wolfram code rules.
  #
  # I hope to support custom rules and types soon.
  class Automaton

    # Public: Initialize a new Automaton.
    #
    # name        - String name of the automaton.
    # dimensions  - Integer number of dimensions for the automaton's
    #               grid. Default is 1.
    # type        - Currently only :elementary.
    # width       - The Integer width of the automaton's grid.
    # rule        - Rule of the automaton. Currently rule is a Symbol
    #               following this pattern: :wolfram_code_X, where X is
    #               the rule number, from 0 to 255.
    def initialize(name, dimensions, type, width, rule)
      panic "Bad dimensions: #{dimensions}" if dimensions != 1
      panic "Bad type: #{type}" if type != :elementary
      panic "Bad width: #{width}" if width < 1
      @name = name
      @dimensions = dimensions
      @type = type
      @width = width
      @rule = Rule.new(rule)
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
    # If, for example, `student.generations == 4` then #generate will
    # produce 5 generations: The original generation plus the four you
    # want.
    #
    # study - Study instance.
    # block - What to do with a generation.
    #
    # Example
    #
    #    automaton.generate(study) do |num, generation|
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
    def generate(study, &block)
      adapt_for_single_method if study.method == :single
      block.call(0, @grid)
      1.upto(study.generations) do |cell_index|
        apply_rule(study)
        block.call(cell_index, @grid)
      end
    end

    private

    # Returns nothing.
    def adapt_for_single_method
      @width += 1 if @width % 2 == 0
      @grid = Array.new(@width, 0)
      @grid[@width / 2] = 1
    end

    # Apply rule to the entire grid. @grid becomes the next generation.
    #
    # study - Study instance.
    #
    # Returns nothing.
    def apply_rule(study)
      next_grid = @grid.map.with_index do |cell, index|
        @rule.apply_rule(index, @grid, study)
      end
      @grid = next_grid
    end

  end
end
