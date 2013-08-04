require './spec/helper'

describe WolframCodeRule do

  describe "creation" do# {{{

    it "should retain rule number" do
      object = WolframCodeRule.new(110)
      object.rule_number.should == 110
    end

    it "should raise error if rule_number isn't an integer" do
      lambda do
        WolframCodeRule.new(:foo_bar_110)
      end.should raise_error(SystemExit)
    end

    it "should raise error if rule_number is greater than 255" do
      lambda do
        WolframCodeRule.new(256)
      end.should raise_error(SystemExit)
    end

    it "should raise error if rule_number is less than 0" do
      lambda do
        WolframCodeRule.new(-110)
      end.should raise_error(SystemExit)
    end

  end# }}}

  describe "applying a rule" do# {{{
    before do
      @object = WolframCodeRule.new(4)
      @grid = [0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0]
      @study_method = StudyMethod.new(:random)
    end

    specify { @object.apply_rule(0, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(1, @grid, @study_method).should == 1 }
    specify { @object.apply_rule(2, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(3, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(4, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(5, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(6, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(7, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(8, @grid, @study_method).should == 1 }
    specify { @object.apply_rule(9, @grid, @study_method).should == 0 }
    specify { @object.apply_rule(10, @grid, @study_method).should == 0 }
  end# }}}

  describe "self#wolfram_code" do# {{{
    it "should return the code" do
      WolframCodeRule.wolfram_code(:wolfram_code_123).should == 123
    end

    it "should exit with code < 0" do
      lambda do
        WolframCodeRule.wolfram_code(:"wolfram_code_-1")
      end.should raise_error(SystemExit)
    end

    it "should exit with code > 255" do
      lambda do
        WolframCodeRule.wolfram_code(:wolfram_code_256)
      end.should raise_error(SystemExit)
    end
  end# }}}

  describe "self#wolfram_code?" do# {{{
    it "should tell yes if good code" do
      WolframCodeRule.wolfram_code?(:wolfram_code_123).should be_true
    end

    it "should tell no if bad symbol" do
      WolframCodeRule.wolfram_code?(:wolfram_123).should be_false
    end

    it "should tell no if not a symbol" do
      WolframCodeRule.wolfram_code?(123).should be_false
    end

  end# }}}

end

