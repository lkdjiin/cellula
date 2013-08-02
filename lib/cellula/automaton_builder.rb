module Cellula

  # Public: Provides an interface to build Automaton objects.
  # 
  # Examples
  #
  #   ca = AutomatonBuilder.new("my name").build
  #   ca = AutomatonBuilder.new("my name").dimensions(2).build
  class AutomatonBuilder

    # Public: Initialize an new AutomatonBuilder.
    #
    # name - String name of the futur Automaton.
    def initialize(name)
      @name = name
      @dimensions = 1
      @type = :elementary
      @width = 20
      @rule = :wolfram_code_110
    end

    # Public: Set the Integer dimensions of the automaton's grid.
    # Default is 1.
    #
    # Returns self.
    def dimensions(val); @dimensions = val; self; end

    # Public: Set the Symbol type of the automaton. Default is
    # :elementary.
    #
    # Returns self.
    def type(val); @type = val; self; end

    # Public: Set the Integer width of the automaton's grid.
    # Default is 20.
    #
    # Returns self.
    def width(val); @width = val; self; end

    # Public: Set the rule of the automaton.
    # Default is :wolfram_code_110.
    #
    # Returns self.
    def rule(val); @rule = val; self; end

    # Public: Builds an Automaton with characteristics given with
    # the setters methods.
    #
    # Returns Automaton.
    def build
      Automaton.new(@name, @dimensions, @type, @width, @rule)
    end
  end
end

