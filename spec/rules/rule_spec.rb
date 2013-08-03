require './spec/helper'

describe Rule do

  describe "creation" do# {{{
    it "should raise error if rule_number isn't a symbol" do
      lambda {Rule.new(110)}.should raise_error(SystemExit)
    end

    it "should raise error if rule_number is greater than 255" do
      lambda {Rule.new(:wolfram_code_256)}.should raise_error(SystemExit)
    end

    it "should raise error if rule_number is less than 0" do
      lambda {Rule.new(:"wolfram_code_-110")}.should raise_error(SystemExit)
    end

  end# }}}

  describe "applying a rule" do# {{{
    before do
      @object = Rule.new(:wolfram_code_4)
      @grid = [0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0]
    end

    specify { @object.apply_rule(0, @grid, nil).should == 0 }
    specify { @object.apply_rule(1, @grid, nil).should == 1 }
    specify { @object.apply_rule(2, @grid, nil).should == 0 }
    specify { @object.apply_rule(3, @grid, nil).should == 0 }
    specify { @object.apply_rule(4, @grid, nil).should == 0 }
    specify { @object.apply_rule(5, @grid, nil).should == 0 }
    specify { @object.apply_rule(6, @grid, nil).should == 0 }
    specify { @object.apply_rule(7, @grid, nil).should == 0 }
    specify { @object.apply_rule(8, @grid, nil).should == 1 }
    specify { @object.apply_rule(9, @grid, nil).should == 0 }
    specify { @object.apply_rule(10, @grid, nil).should == 0 }
  end# }}}

end

