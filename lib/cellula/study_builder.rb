module Cellula

  # Public: Provides an interface to build Study objects.
  # 
  # Examples
  #
  #   ca = StudyBuilder.new("CA name").build
  #   ca = StudyBuilder.new("CA name").generations(99).build
  class StudyBuilder

    # Public: Initialize an new StudyBuilder.
    #
    # ca_name - String name of the cellular automaton that the Study
    #           wants to study.
    def initialize(ca_name)
      @ca_name = ca_name
      @method = :random
      @generations = 10
    end

    # Public: Set the Symbol method of study.
    # Default is :random.
    #
    # Returns self.
    def method(val); @method = val; self; end

    # Public: Set the Integer number of generations to study.
    # Default is 10.
    #
    # Returns self.
    def generations(val); @generations = val; self; end

    # Public: Builds a Study with characteristics given with
    # the setters methods.
    #
    # Returns Study.
    def build
      Study.new(@ca_name, @method, @generations)
    end
  end
end


