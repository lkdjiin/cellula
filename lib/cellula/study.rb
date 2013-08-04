module Cellula

  # Public: This class provides all it's needed to set up a study.
  # Study's goal is to study cellular automaton.
  #
  # You rarely wants to initialize an Study object directly. This is
  # because Study's creation needs a lots of parameters. It is
  # much more simpler to create a Study object using StudyBuilder.
  #
  # TODO Document studying methods.
  class Study

    # Public: Initialize a new Study.
    #
    # ca_name     - String name of the automaton to study.
    # method      - Symbol how to study the automaton.
    #               Default is :random.
    #               Could be one of:
    #               * :random
    #               * :single
    #               * :summed
    #               * :averaged
    #               Currently limited to :random.
    # generations - Integer number of generations to study.
    #               Default is 10.
    def initialize(ca_name, method, generations)
      @ca_name = ca_name
      @method = method
      @generations = generations
      panic "Bad number of generations: #{generations}" if generations < 1
      panic "Bad studying method: #{method}" if bad_studying_method
    end

    # Public: Get the String ca_name of the automaton to study.
    attr_reader :ca_name

    # Public: Set/get the Symbol studying method.
    attr_accessor :method

    # Public: Set/get the Integer number of generations to study.
    attr_accessor :generations

    def say_hello
      "Studying #{@ca_name} with #{@method} method " +
      "over #{@generations} generations."
    end

    private

    def bad_studying_method
      @method != :random && @method != :single
    end
  end
end


