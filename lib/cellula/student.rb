module Cellula

  # Public: This class provides all it's needed to set up a student.
  # Student' goal is to study cellular automaton.
  #
  # You rarely wants to initialize an Student object directly. This is
  # because Student's creation needs a lots of parameters. It is
  # much more simpler to create a Student object using StudentBuilder.
  #
  # TODO Document studying methods.
  class Student

    # Public: Initialize a new Student.
    #
    # ca_name        - String ca_name of the automaton to study.
    # method      - Symbol how to study the automaton.
    #               Default is :random.
    #               Could be one of:
    #               * :random
    #               * :single
    #               * :summed
    #               * :averaged
    # generations - Integer number of generations to study.
    #               Default is 10.
    def initialize(ca_name, method, generations)
      @ca_name = ca_name
      @method = method
      @generations = generations
    end

    # Public: Get the String ca_name of the automaton to study.
    attr_reader :ca_name

    # Public: Set/get the Symbol studying method.
    attr_accessor :method

    # Public: Set/get the Integer number of generations to study.
    attr_accessor :generations

    def say_hello
      puts "Hello, I am #{@ca_name}."
      puts "I am studying with a #{@method} method."
    end
  end
end


