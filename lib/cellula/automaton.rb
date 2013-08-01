module Cellula

  class Automaton

    def initialize(name, dimension, type, width, rules)
      @name = name
      @dimension = dimension
      @type = type
      @width = width
      @rules = rules
    end

    attr_accessor :name
    attr_accessor :dimension
    attr_accessor :type
    attr_accessor :width
    attr_accessor :rules
  end
end
