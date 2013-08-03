module Cellula

  # Internal: Know how to apply a rule to a single cell.
  class Rule

    # Public: Initialize a new Rule object.
    #
    # rule - Currently accept only wolfram code, in the form
    #        of a Symbol like :wolfram_code_110.
    def initialize(rule)
      if wolfram_code?(rule)
        @rule = WolframCodeRule.new wolfram_code(rule)
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

    private

    # Returns Boolean true if rule follow the :wolfram_code_X pattern.
    def wolfram_code?(rule)
      rule.is_a?(Symbol) && rule.to_s.start_with?("wolfram_code_")
    end

    # Returns the Integer number part of a :wolfram_code_X pattern.
    # Exit application if the resulting number isn't between 0 and 255.
    def wolfram_code(rule)
      num = rule.to_s.delete("wolfram_code_").to_i
      if num < 0 || num > 255
        panic "Bad wolfram code: #{rule.to_s}"
      else
        num
      end
    end

  end
end
