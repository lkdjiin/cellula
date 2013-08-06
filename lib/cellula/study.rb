module Cellula

  # Public: This class provides all it's needed to set up a study.
  # Study's goal is to study cellular automaton.
  #
  # You rarely wants to initialize an Study object directly. This is
  # because Study's creation needs a lots of parameters. It is
  # much more simpler to create a Study object using StudyBuilder.
  #
  # Study's methods
  # ---------------
  # There is currently two kind of study's methods: random initial state
  # (:random) and single 1 histories (:single). The following is quoted
  # from Wikipedia:
  #
  # **Single 1 histories**
  #
  # One method used to study these automata is to follow its history
  # with an initial state of all 0s except for a single cell with a 1.
  # When the rule number is even (so that an input of 000 does not
  # compute to a 1) it makes sense to interpret state at each time, t,
  # as an integer expressed in binary, producing a sequence a(t) of
  # integers.
  #
  # **Random initial state**
  #
  # A second way to investigate the behavior of these automata is to
  # examine its history starting with a random state.  Each computed
  # result is placed under that results' source creating a
  # two-dimensional representation of the system's evolution.
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
    #               Currently limited to :random and :single.
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


