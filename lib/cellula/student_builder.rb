module Cellula

  # Public: Provides an interface to build Student objects.
  # 
  # Examples
  #
  #   ca = StudentBuilder.new("CA name").build
  #   ca = StudentBuilder.new("CA name").generations(99).build
  class StudentBuilder

    # Public: Initialize an new StudentBuilder.
    #
    # ca_name - String name of the cellular automaton that the Student
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

    # Public: Builds a Student with characteristics given with
    # the setters methods.
    #
    # Returns Student.
    def build
      Student.new(@ca_name, @method, @generations)
    end
  end
end


