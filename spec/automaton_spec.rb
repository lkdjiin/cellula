require './spec/helper'

describe Automaton do
  describe "generate" do
    before do
      @object = Automaton.new("Test", 1, :elementary, 10, :wolfram_code_0)
      @store = []
      @object.generate(4) do |num, generation|
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
