module Cellula

  # Internal: Know how to apply a rule to a single cell.
  class Rule

    # Public: Initialize a new Rule object.
    #
    # rule - Currently accept only wolfram code, in the form
    #        of a Symbol like :wolfram_code_110.
    def initialize(rule)
      if WolframCodeRule.wolfram_code?(rule)
        @rule = WolframCodeRule.new WolframCodeRule.wolfram_code(rule)
      else
        panic "Unknown rule: #{rule.to_s}"
      end
    end

    # Public: Apply the rule on a single cell.
    #
    # cell_number - Integer number of the cell to apply the rule on.
    # grid        - The entire grid as an Array of Integer.
    # study       - Study instance.
    #
    # Returns the Integer new state of the cell for the next generation.
    def apply_rule(cell_number, grid, study)
      @rule.apply_rule(cell_number, grid, study)
    end

  end
end
