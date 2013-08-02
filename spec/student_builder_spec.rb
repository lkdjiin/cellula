require './spec/helper'

describe StudentBuilder do

  describe "builds student with default values" do# {{{
    before { @object = StudentBuilder.new("cellular automaton name").build }
    subject { @object }

    its(:ca_name) { should eq "cellular automaton name" }
    its(:generations) { should eq 10 }
    its(:method) { should eq :random }

    it "should not allow to change ca_name" do
      lambda{ @object.ca_name = "other" }.should raise_error(NoMethodError)
    end
  end# }}}

  describe "specifying generations" do# {{{
    before do
      @object = StudentBuilder.new("ca name").generations(6).build
    end
    subject { @object }

    its(:generations) { should eq 6 }
  end# }}}

  describe "specifying method" do# {{{
    before do
      @object = StudentBuilder.new("ca name").method(:other).build
    end
    subject { @object }

    its(:method) { should eq :other }
  end# }}}

end
