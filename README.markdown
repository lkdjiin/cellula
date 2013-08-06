Cellula
================

Description
-----------

Cellula aims to be a framework for building, running and studying
cellular automata.

My main goal with Cellula is to *study* cellular automata, not only to *run*
them, so don't expect fancy graphics.

Another goal is to provide a simple DSL, allowing non-programmers to use
Cellula. Following is an example of Cellula DSL:

``` ruby
automaton "Test CA" do
  dimensions 1
  type       :elementary
  width      20
  rule       :wolfram_code_110
end

study "Test CA" do
  method      :random
  generations 4
end
```

Save the previous example in a file named `my_automaton.rb` and
launch it with:

    cellula path/to/my_automaton.rb


Install
-------------------------

    gem install cellula

Usage
--------------------------
*This is a work in progress. More documentation is coming…*

### automaton specifications

* dimensions
  Number of dimensions of the grid. Currently Cellula supports only
  1D grids.
* type
  Type of the automaton. Currently only :elementary (one-dimensional, 2
  possible states per cell, neighbors are the immediate neighbors' cells.
* width
  Width of the grid.
* rule
  Currently only Wolfram code.

### study specifications

* method
  The study's method. Could be :random or :single. (View doc/study.rb
  for more details)
* generations
  Number of generations to process.

Dependencies
--------------------------

  * ruby >= 2.0.0

Contributing
-------------------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### There is many other ways to contibute to FIXME

1. Report any bug
2. Give me ideas
3. Correct my poor english syntax
4. Blog about Cellula
5. Tell Cellula to your friends and colleagues

License
--------------------------
Apache v2 License (See LICENSE file).


Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions, or contact me on [twitter](https://twitter.com/lkdjiin).
