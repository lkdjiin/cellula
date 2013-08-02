require './spec/helper'

describe Student do
  before { @object = StudentBuilder.new("cellular automaton name").build }

  it "should say hello" do
    @object.say_hello.start_with?(
      "Hello, I'm studying #{@object.ca_name}").should be_true
  end
end

