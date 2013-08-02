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
    describe "valid number of generations" do
      before do
        @object = StudentBuilder.new("ca name").generations(6).build
      end
      subject { @object }

      its(:generations) { should eq 6 }
    end

    describe "invalid number" do
      it "should exit with a number < 1" do
        lambda do
          StudentBuilder.new("ca name").generations(0).build
        end.should raise_error(SystemExit)
      end
    end
  end# }}}

  describe "specifying method" do# {{{
    describe "valid method" do
      before do
        @object = StudentBuilder.new("ca name").method(:random).build
      end
      subject { @object }

      its(:method) { should eq :random }
    end

    describe "invalid method" do
      it "should exit if method isn't :random" do
        lambda do
          StudentBuilder.new("ca name").method(:single).build
        end.should raise_error(SystemExit)
      end
    end
  end# }}}

end
