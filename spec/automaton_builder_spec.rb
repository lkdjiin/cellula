require './spec/helper'

describe AutomatonBuilder do

  describe "builds automaton with default values" do# {{{
    before { @object = AutomatonBuilder.new("my name").build }
    subject { @object }

    its(:name) { should eq "my name" }
    its(:dimensions) { should eq 1 }
    its(:type) { should eq :elementary }
    its(:width) { should eq 20 }
    its(:rules) { should eq :wolfram_code_110 }

    it "should not allow to change name" do
      lambda{ @object.name = "other" }.should raise_error(NoMethodError)
    end
  end# }}}

  describe "specifying dimensions" do# {{{
    before do
      @object = AutomatonBuilder.new("my name").dimensions(2).build
    end
    subject { @object }

    its(:dimensions) { should eq 2 }
  end# }}}

  describe "specifying type" do# {{{
    before do
      @object = AutomatonBuilder.new("my name").type(:other).build
    end
    subject { @object }

    its(:type) { should eq :other }
  end# }}}

  describe "specifying width" do# {{{
    before do
      @object = AutomatonBuilder.new("my name").width(123).build
    end
    subject { @object }

    its(:width) { should eq 123 }
  end# }}}

  describe "specifying rules" do# {{{
    before do
      @object = AutomatonBuilder.new("my name").rules(:other).build
    end
    subject { @object }

    its(:rules) { should eq :other }
  end# }}}

end

