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

      describe "rule 28" do# {{{
        before do
          @object = Automaton.new("Test", 1, :elementary, 10, :wolfram_code_28)
          @study = StudyBuilder.new("Test").generations(4).method(:single).build
          @store = []
          @object.generate(@study) do |num, generation|
            @store << generation
          end
        end
        
        specify "good result" do
          @store[0].join.should == "1"
          @store[1].join.should == "11"
          @store[2].join.should == "101"
          @store[3].join.should == "1011"
          @store[4].join.should == "10101"
        end
      end# }}}

      describe "rule 50" do# {{{
        before do
          @object = Automaton.new("Test", 1, :elementary, 10, :wolfram_code_50)
          @study = StudyBuilder.new("Test").generations(4).method(:single).build
          @store = []
          @object.generate(@study) do |num, generation|
            @store << generation
          end
        end
        
        specify "good result" do
          @store[0].join.should == "1"
          @store[1].join.should == "101"
          @store[2].join.should == "10101"
          @store[3].join.should == "1010101"
          @store[4].join.should == "101010101"
        end
      end# }}}

      describe "rule 54" do# {{{
        before do
          @object = Automaton.new("Test", 1, :elementary, 10, :wolfram_code_54)
          @study = StudyBuilder.new("Test").generations(4).method(:single).build
          @store = []
          @object.generate(@study) do |num, generation|
            @store << generation
          end
        end
        
        specify "good result" do
          @store[0].join.should == "1"
          @store[1].join.should == "111"
          @store[2].join.should == "10001"
          @store[3].join.should == "1110111"
          @store[4].join.should == "100010001"
        end
      end# }}}

    end# }}}

  end
end
