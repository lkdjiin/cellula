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
      @rule_number = rule_number
      begin
        check_rule_number
      rescue Exception => ex
        panic ex.message
      end
      @binary_string = "%08b" % @rule_number
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
      @cell_number = cell_number
      @grid = grid
      case study.method
      when :random then apply_rule_with_random_method
      when :single then apply_rule_with_single_method
      end
    end

    # Get the Integer number part of a :wolfram_code_X pattern.
    #
    # pattern - Wolfram code pattern as a Symbol.
    #
    # Returns the Integer number part of the pattern.
    # Exit application if the resulting number isn't between 0 and 255.
    def self.wolfram_code(pattern)
      pattern = pattern.to_s
      num = pattern.delete("wolfram_code_").to_i
      if num < 0 || num > 255
        panic "Bad wolfram code: #{pattern}"
      else
        num
      end
    end

    # Tells if a symbol follow the :wolfram_code_X pattern.
    #
    # symb - The Symbol to test.
    #
    # Returns Boolean true if sym is a :wolfram_code_X pattern.
    def self.wolfram_code?(symb)
      symb.is_a?(Symbol) && symb.to_s.start_with?("wolfram_code_")
    end

    private

    # Returns 0 or 1.
    def apply_rule_with_random_method
      next_generation_cell(left_cell, @grid[@cell_number], right_cell)
    end

    # Get state of the cell to the left of the current one.
    #
    # Returns 0 or 1.
    def left_cell
      if @cell_number > 0
        @grid[@cell_number - 1]
      else
        @grid[-1]
      end
    end

    # Get state of the cell to the right of the current one.
    #
    # Returns 0 or 1.
    def right_cell
      if @cell_number == @grid.size - 1
        @grid[0]
      else
        @grid[@cell_number + 1]
      end
    end

    # Returns 0 or 1.
    def apply_rule_with_single_method
      next_generation_cell(left_cell_single, @grid[@cell_number], right_cell_single)
    end

    # Returns 0 or 1.
    def next_generation_cell(left, middle, right)
      case [left, middle, right]
      when [1,1,1] then @binary_string[0].to_i
      when [1,1,0] then @binary_string[1].to_i
      when [1,0,1] then @binary_string[2].to_i
      when [1,0,0] then @binary_string[3].to_i
      when [0,1,1] then @binary_string[4].to_i
      when [0,1,0] then @binary_string[5].to_i
      when [0,0,1] then @binary_string[6].to_i
      when [0,0,0] then @binary_string[7].to_i
      end
    end

    # Returns 0 or 1.
    def left_cell_single
      if @cell_number > 0
        @grid[@cell_number - 1]
      else
        0
      end
    end

    # Returns 0 or 1.
    def right_cell_single
      if @cell_number == @grid.size - 1
        0
      else
        @grid[@cell_number + 1]
      end
    end

    # Check if rule's number (@rule_number) is in the range 0..255.
    #
    # Returns nothing.
    # Raises ArgumentError if rule's number isn't in the range 0..255.
    def check_rule_number
      unless @rule_number >= 0 and @rule_number <= 255
        raise ArgumentError, "Bad Wolfram Code: #{number}"
      end
    end

  end

end
