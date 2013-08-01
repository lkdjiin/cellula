module Cellula

  class AutomatonBuilder

    def initialize(name)
      @name = name
    end
    
    def dimension(v = 1); @dimension = v; end

    def type(v = :elementary); @type = v; end

    def width(v = 10); @width = v; end

    def rules(v = :wolfram_code_110); @rules = v; end

    def build
      Automaton.new(@name, @dimension, @type, @width, @rules)
    end
  end
end

