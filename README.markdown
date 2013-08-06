Cellula
================


Description
-----------

Cellula's goal is to be a framework for building, running and studying
cellular automata. For this, Cellula provides a simple DSL.

Following is an example of Cellula DSL:

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
This is a work in progress. More documentation is coming…



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
