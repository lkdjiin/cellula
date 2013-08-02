require 'docile'
require 'cellula/automaton'
require 'cellula/student'
require 'cellula/automaton_builder'
require 'cellula/student_builder'

# Public: Cellula is a framework for building, running and studying
# cellular automata. For this, Cellula provides a simple DSL.
#
# Following is an example of Cellula DSL:
#
#     automaton "his name" do
#       dimension 1
#       type      :elementary
#       width     20
#       rules     :wolfram_code_110
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
    @student = Docile.dsl_eval(StudentBuilder.new(name), &block).build
  end

  def run
    @auto.generate(@student.generations) do |num, generation|
      printf "Gen %4s: %s\n", num, generation.join()
    end
    @student.say_hello
  end

end
