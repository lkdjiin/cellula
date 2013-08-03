require 'docile'
require 'cellula/automaton'
require 'cellula/study'
require 'cellula/automaton_builder'
require 'cellula/study_builder'
require 'cellula/rule'

# Public: Cellula is a framework for building, running and studying
# cellular automata. For this, Cellula provides a simple DSL.
#
# Following is an example of Cellula DSL:
#
#     automaton "his name" do
#       dimension 1
#       type      :elementary
#       width     20
#       rule      :wolfram_code_110
#     end
#
#  Save the previous example in a file named `my_automaton.rb` and
#  launch it with:
#
#     cellula path/to/my_automaton.rb
module Cellula

  # Internal: Part of the DSL API, this method builds a new Automaton
  # object via AutomatonBuilder.
  #
  # name  - String name of the automaton.
  # block - A Ruby block to build the automaton.
  #
  # Returns nothing.
  def automaton(name, &block)
    @auto = Docile.dsl_eval(AutomatonBuilder.new(name), &block).build
  end

  # Internal: Part of the DSL API, this method builds a new Student
  # object via StudentBuilder.
  #
  # name  - String name of the automaton to study.
  # block - A Ruby block to build the automaton.
  #
  # Returns nothing.
  def study(name, &block)
    @student = Docile.dsl_eval(StudyBuilder.new(name), &block).build
  end

  # Public: Display a banner on stdout.
  #
  # Returns nothing.
  def banner
    puts "Cellula version " + File.read('VERSION').strip
    puts ""
  end

  # Public: Display application's usage on stdout.
  #
  # Returns nothing.
  def usage
    puts "
    usage:

    cellula path/to/automaton_file.rb
    "
  end

  # Public: Print an error message and exit with code 1.
  #
  # message - The String message to display to user before exiting.
  #
  # Returns nothing.
  def panic(message = "Unknown error")
    puts "** Panic **"
    puts message
    exit(1)
  end
end
