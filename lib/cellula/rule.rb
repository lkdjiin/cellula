module Cellula

  # Internal: This class know how to apply a rule to a single cell.
  # TODO Extract WolframCodeRule
  class Rule

    # Public: Initialize a new Rule object.
    #
    # rule_number - Currently accept only wolfram code, in the form
    #               of a Symbol like :wolfram_code_110.
    def initialize(rule_number)
      begin
        @rule_number = deduce_rule_number(rule_number)
      rescue Exception => e
        panic e.message
      end
    end

    # Public: Get the Integer wolfram code of the rule.
    attr_reader :rule_number

    # Public: Apply the rule on a single cell. You could read about the
    # Wolfram code numbering system here:
    # http://en.wikipedia.org/wiki/Elementary_cellular_automaton
    #
    # cell_number - Integer number of the cell to apply the rule on.
    # grid        - The entire grid as an Array of Integer.
    #
    # Returns the Integer new state of the cell for the next generation.
    def apply_rule(cell_number, grid)
      width = grid.size
      cell = grid[cell_number]
      left_cell = if cell_number > 0
        grid[cell_number - 1]
      else
        grid[-1]
      end
      right_cell = if cell_number == width - 1
        grid[0]
      else
        grid[cell_number + 1]
      end
      binary_string = "%08b" % @rule_number
      case [left_cell, cell, right_cell]
      when [1,1,1] then binary_string[0].to_i
      when [1,1,0] then binary_string[1].to_i
      when [1,0,1] then binary_string[2].to_i
      when [1,0,0] then binary_string[3].to_i
      when [0,1,1] then binary_string[4].to_i
      when [0,1,0] then binary_string[5].to_i
      when [0,0,1] then binary_string[6].to_i
      when [0,0,0] then binary_string[7].to_i
      end
    end

    private

    # Find the integer number from the wolfram code given like
    # :wolfram_code_110.
    #
    # rule - A Symbol like :wolfram_code_110.
    #
    # Example
    #
    #     deduce_rule_number(:wolfram_code_123)
    #     # => 123
    #
    # Returns the Integer number of the rule.
    # Raises ArgumentError if rule is not in the form :wolfram_code_X,
    #   where X is a number between 0 and 255.
    def deduce_rule_number(rule)
      if wolfram_code?(rule)
        wolfram_code(rule)
      else
        raise ArgumentError, "Unknown rule: #{rule.to_s}"
      end
    end

    # Returns Boolean true if rule follow the :wolfram_code_X pattern.
    def wolfram_code?(rule)
      rule.is_a?(Symbol) && rule.to_s.start_with?("wolfram_code_")
    end

    # Returns the Integer number part of a :wolfram_code_X pattern.
    # Raises ArgumentError if the resulting number isn't between 0
    #   and 255.
    def wolfram_code(rule)
      num = rule.to_s.delete("wolfram_code_").to_i
      if num < 0 || num > 255
        raise ArgumentError, "Bad wolfram code: #{rule.to_s}"
      else
        num
      end
    end

  end
end
