automaton "Test CA" do
  dimensions 1
  type      :elementary
  width     80
  rule      :wolfram_code_104
end

study "Test CA" do
  method      :random
  generations 80
end
