require './spec/helper'

describe AutomatonBuilder do

  describe "builds automaton with default values" do# {{{
    before { @object = AutomatonBuilder.new("my name").build }
    subject { @object }

    its(:name) { should eq "my name" }
    its(:dimensions) { should eq 1 }
    its(:type) { should eq :elementary }
    its(:width) { should eq 20 }
    specify { @object.rule.is_a?(Rule).should be_true }

    it "should not allow to change name" do
      lambda{ @object.name = "other" }.should raise_error(NoMethodError)
    end
  end# }}}

  describe "specifying dimensions" do# {{{
    describe "valid dimensions" do
      before do
        @object = AutomatonBuilder.new("my name").dimensions(1).build
      end
      subject { @object }

      its(:dimensions) { should eq 1 }
    end

    describe "invalid dimensions" do

      it "should exit with dimensions < 1" do
        lambda do
          AutomatonBuilder.new("my name").dimensions(0).build
        end.should raise_error(SystemExit)
      end

      it "should exit with dimensions > 1" do
        lambda do
          AutomatonBuilder.new("my name").dimensions(2).build
        end.should raise_error(SystemExit)
      end

    end

  end# }}}

  describe "specifying type" do# {{{
    describe "valid type" do
      before do
        @object = AutomatonBuilder.new("my name").type(:elementary).build
      end
      subject { @object }

      its(:type) { should eq :elementary }
    end

    describe "invalid type" do
      it "should exit with a bad type of type" do
        lambda do
          AutomatonBuilder.new("my name").type(2).build
        end.should raise_error(SystemExit)
      end

      it "should exit with unknown type " do
        lambda do
          AutomatonBuilder.new("my name").type(:other).build
        end.should raise_error(SystemExit)
      end
    end
  end# }}}

  describe "specifying width" do# {{{
    describe "valid width" do
      before do
        @object = AutomatonBuilder.new("my name").width(123).build
      end
      subject { @object }

      its(:width) { should eq 123 }
    end

    describe "invalid width" do
      it "should exit with a width < 1" do
        lambda do
          AutomatonBuilder.new("my name").width(0).build
        end.should raise_error(SystemExit)
      end
    end
  end# }}}

end

