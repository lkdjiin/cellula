require './spec/helper'

describe Cellula do

  it "should display a banner" do
    expected = "Cellula version " + File.read('VERSION').strip
    $stdout.should_receive(:puts).with(expected)
    $stdout.should_receive(:puts).with("")
    banner
  end

  it "should display usage" do
    $stdout.should_receive(:puts).with(
      "\n    usage:\n\n    cellula path/to/automaton_file.rb\n    ")
    usage
  end

  describe "loading file" do
    it "should load a valid cellula file" do
      file = fixture_file_path "automaton_01.rb"
      lambda { load file }.should_not raise_error
    end
  end

end
