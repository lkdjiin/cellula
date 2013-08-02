module Cellula

  # Public: This class provides all it's needed to run a cellular
  # automaton.
  #
  # You rarely wants to initialize an Automaton directly. This is
  # because Automaton's creation needs a lots of parameters. It is
  # much more simpler to create Automata using AutomatonBuilder class.
  #
  # TODO Document rules.
  class Automaton

    # Public: Initialize a new Automaton.
    #
    # name       - String name of the automaton.
    # dimensions - Integer number of dimensions for the automaton's
    #              grid. Default is 1.
    # type       - Currently only :elementary.
    # width      - The Integer width of the automaton's grid.
    # rules      - Rules of the automaton. TODO write more about the types.
    def initialize(name, dimensions, type, width, rules)
      @name = name
      @dimensions = dimensions
      @type = type
      @width = width
      @rules = rules
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

    # Public: Set/get the rules of the automaton.
    attr_accessor :rules

    # Public:
    def generate(total_generations, &block)
      block.call(0, @grid)
      1.upto(total_generations) do |i|
        apply_rules
        block.call(i, @grid)
      end
    end

    private

    def apply_rules
      next_grid = @grid.map.with_index {|cell, i| rule_4(cell, i) }
      @grid = next_grid
    end

    # 111	110 101	100	011	010	001	000
    #  0   0   0   0   0   1   0   0
    def rule_4(cell, i)
      left_cell = if i > 0
        @grid[i - 1]
      else
        @grid[-1]
      end
      right_cell = if i == @width - 1
        @grid[0]
      else
        @grid[i + 1]
      end
      case [left_cell, cell, right_cell]
      when [1,1,1] then 0
      when [1,1,0] then 0
      when [1,0,1] then 0
      when [1,0,0] then 0
      when [0,1,1] then 0
      when [0,1,0] then 1
      when [0,0,1] then 0
      when [0,0,0] then 0
      end
    end
  end
end
