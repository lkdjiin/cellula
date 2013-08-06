require './spec/helper'

describe Automaton do
  describe "1D automata" do

    context "when studying random method" do# {{{
      describe "#generate" do
        before do
          @object = Automaton.new("Test", 1, :elementary, 10, :wolfram_code_0)
          @study = StudyBuilder.new("Test").generations(4).build
          @store = []
          @object.generate(@study) do |num, generation|
            @store << generation
          end
        end

        specify "a generation other than original is full of 0" do
          @store[1, 4].each do |gen|
            gen.each {|cell| cell.should == 0 }
          end
        end
      end
    end# }}}

    context "when studying single method" do# {{{
 
      describe "rule 28" do# {{{ (See LICENSE file).
        before do
          @object = Automaton.new("Test", 1, :elementary, 20, :wolfram_code_28)
          @study = StudyBuilder.new("Test").generations(4).method(:single).build
          @store = []
          @object.generate(@study) do |num, generation|
            @store << generation
          end
        end

        specify { @store[0].join.should == "000000000010000000000" }
        specify { @store[1].join.should == "000000000011000000000" }
        specify { @store[2].join.should == "000000000010100000000" }
        specify { @store[3].join.should == "000000000010110000000" }
        specify { @store[4].join.should == "000000000010101000000" }
      end# }}}

      describe "rule 50" do# {{{
        before do
          @object = Automaton.new("Test", 1, :elementary, 20, :wolfram_code_50)
          @study = StudyBuilder.new("Test").generations(4).method(:single).build
          @store = []
          @object.generate(@study) do |num, generation|
            @store << generation
          end
        end

        specify { @store[0].join.should == "000000000010000000000" }
        specify { @store[1].join.should == "000000000101000000000" }
        specify { @store[2].join.should == "000000001010100000000" }
        specify { @store[3].join.should == "000000010101010000000" }
        specify { @store[4].join.should == "000000101010101000000" }
      end# }}}

      describe "rule 54" do# {{{
        before do
          @object = Automaton.new("Test", 1, :elementary, 20, :wolfram_code_54)
          @study = StudyBuilder.new("Test").generations(4).method(:single).build
          @store = []
          @object.generate(@study) do |num, generation|
            @store << generation
          end
        end

        specify { @store[0].join.should == "000000000010000000000" }
        specify { @store[1].join.should == "000000000111000000000" }
        specify { @store[2].join.should == "000000001000100000000" }
        specify { @store[3].join.should == "000000011101110000000" }
        specify { @store[4].join.should == "000000100010001000000" }
      end# }}}

    end# }}}

  end
end
