require './spec/helper'

describe Automaton do
  describe "generate" do
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
end
