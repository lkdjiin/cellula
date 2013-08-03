module Cellula

  # Internal: Know how to apply a Wolfram code rule on a single cell.
  class WolframCodeRule

    # Public: Initialize a new WolframCodeRule object.
    # See http://en.wikipedia.org/wiki/Wolfram_code and
    # http://en.wikipedia.org/wiki/Elementary_cellular_automaton
    # for details.
    #
    # rule_number - Integer number of the wolfram code (a number between
    #               0 and 255).
    def initialize(rule_number)
      begin
        @rule_number = check rule_number
      rescue Exception => e
        panic e.message
      end
    end

    # Public: Get the Integer wolfram code of the rule.
    attr_reader :rule_number

    # Public: Apply the rule on a single cell.
    #
    # cell_number - Integer number of the cell to apply the rule on.
    # grid        - The entire grid as an Array of Integer.
    # study       - Study instance.
    #
    # Returns the Integer new state of the cell for the next generation.
    def apply_rule(cell_number, grid, study)
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

    # Returns its argument if it's in the range 0..255.
    # Raises ArgumentError if number isn't in the range 0..255.
    def check number
      if number >= 0 and number <= 255
        number
      else
        raise ArgumentError, "Bad Wolfram Code: #{number}"
      end
    end
  end
end
