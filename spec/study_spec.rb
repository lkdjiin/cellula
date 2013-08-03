require './spec/helper'

describe Study do
  before { @object = StudyBuilder.new("cellular automaton name").build }

  it "should say hello" do
    @object.say_hello.start_with?(
      "Studying #{@object.ca_name}").should be_true
  end
end

